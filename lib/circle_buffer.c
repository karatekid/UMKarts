#include "circle_buffer.h"

void CircularBufferInit(CircularBuffer * cb, void ** buffer, size_t capacity) {
  size_t i;
  cb->buffer = buffer;
  for (i = 0; i < capacity; i++) cb->buffer[i] = NULL;
  cb->len = capacity;
  cb->read = 0;
  cb->write = 0;
}


int CircularBufferWrite(CircularBuffer *cb, void *item) {
  size_t write, new_write;
  do {
    write = (*((volatile size_t *) (&(cb->write))));
    new_write = write + 1;
    if (new_write >= cb->len) new_write = 0;
    /* If were at new_write == cb->read, then we're out of room */
    if (new_write == cb->read) {
      return -EBUFFULL;
    }
  }while(!(__sync_bool_compare_and_swap(&(cb->write), write, new_write)));

  cb->buffer[write] = item;

  return 0;
}

int CircularBufferRead(CircularBuffer *cb, void **item) {
  if (cb->read == cb->write) {
    *item = NULL;
    return -EBUFEMPTY;
  }
  item = cb->buffer[cb->read];
  /* Can occur if we interrupt the write functionality before the item was copied
   * into the buffer. Race condition, so safe call is to return empty buffer
   */
  if (item == NULL) {
    return -EBUFEMPTY;
  }

  cb->buffer[cb->read] = NULL;

  cb->read = cb->read + 1;
  if (cb->read >= cb->len) cb->read = 0;

  return 0;
}
