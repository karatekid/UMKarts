#include "xbee_interface.h"
#include "xbee_writer.h"

#define MSS_UART_QUEUE_SIZE 16

static void _xbee_interface_tx_handler(mss_uart_instance_t * this_uart); 
static int _xbee_interface_tx_start(); 

/* Send buffer Variables */
static struct {
  void * circle_buf_mem[XBEE_PACKET_BUF_SIZE];
  CircularBuffer circle_buf;
  uint8_t uart_queue[MSS_UART_QUEUE_SIZE];
  size_t  uart_queue_size;
  unsigned char lock;
  struct xbee_writer xw;
} _xbee_tx;

void  _xbee_interface_tx_init() {
  CircularBufferInit(&_xbee_tx.circle_buf,
                     _xbee_tx.circle_buf_mem,
                     XBEE_TX_BUF_NUM_PACKETS);
  _xbee_tx.uart_queue_size = 0;
  _xbee_tx.lock = 0;

  MSS_UART_set_tx_handler(&g_mss_uart1, _xbee_interface_tx_handler);
}

int xbee_send(struct xbee_packet *xp) {
  int err;
  err = CircularBufferWrite(&_xbee_tx.circle_buf, xp);
  if (err == 0 && (_xbee_interface_tx_start() == 0)) {
    _xbee_interface_tx_handler(&g_mss_uart1);
  }
  return err;
}

static int _xbee_interface_tx_start() {
  struct xbee_packet * xp;
  if (__sync_lock_test_and_set(&(_xbee_tx.lock), 1) == 0) {
    // Try new packet
    xp = CircularBufferRead(&(_xbee_tx.circle_buf));
    if (!xp) {
      /* Release lock */
      __sync_lock_release(&(_xbee_tx.lock));
      return -EXBEEINTTXEMPTY; // We are done!!
    }

    XBeeWriterInit(&(_xbee_tx.xw), xp);
    _xbee_tx.uart_queue_size = 0;
    return 0;
  }
  else {
    return -EXBEEINTTXLOCKED;
  }
}

static void _xbee_interface_tx_handler(mss_uart_instance_t * this_uart) {
  uint8_t * start_ptr, * end_ptr, * move_ptr;
  size_t items_in_fifo;

  int err = _xbee_interface_tx_start();
  if (err == -EXBEEINTTXEMPTY) {
    /* QUEUE is empty! Yay! We can just return */
    return;
  }
  else {
    /* WE don't care, we do the same thing no matter if it's locked or not */
  }


  /* Copy data from packet into queue to be moved into xbee buffer */
  start_ptr = _xbee_tx.uart_queue + _xbee_xt.uart_queue_size;
  end_ptr = _xbee_tx.uart_queue + sizeof(uint8_t) * MSS_UART_QUEUE_SIZE;
  end_ptr = XBeeWriterWrite(&(_xbee_tx.xw), start_ptr, end_ptr);

  items_in_fifo = MSS_UART_fill_tx_fifo(this_uart, (const uint8_t *) _xbee_tx.uart_queue, end_ptr);
  move_ptr = xbee_tx.uart_queue + items_in_fifo;
  _xbee_tx.uart_queue_size = 0;
  while (move_ptr != end_ptr) {
    _xbee_tx.uart_queue[_xbee_tx.uart_queue_size++] = *move_ptr++;
  }
  if (_xbee_tx.uart_queue_size == 0 && XBeeWriterDone(&(_xbee_tx.xw))) {
    xbee_interface_free_packet(_xbee_tx.xw->xp);
    __sync_lock_release(&(_xbee_tx.lock));
  }
}

