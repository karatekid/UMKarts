#include "simple_allocator.h"
#include "atomics.h"
#include <errno.h>


int SimpleAllocatorInit(SimpleAllocator * sa, void *buf, size_t num_items, size_t item_sz) {
  /* sizeof(uint32_t)*8 = number of bits we have */
  if (num_items > sizeof(sa->empty_mask)*8) return -EINVAL;
  sa->buf = buf;
  sa->num_items = num_items;
  sa->item_sz = item_sz;
  sa->empty_mask = 0;
  return 0;
}

void * SimpleAllocatorAlloc(SimpleAllocator * sa) {
  size_t i;
  uint32_t new_empty, old_empty;
  for (i = 0; i < sa->num_items; i++) {
    old_empty = *((volatile uint32_t *) &(sa->empty_mask));
    if (!(old_empty & (0x1 << i))) {
    	new_empty = old_empty | (0x1 << i);
      if (atomic_cmpxchg_4((int *) &(sa->empty_mask), (int) new_empty, (int) old_empty) == 0) {
        return sa->buf + i*sa->item_sz;
      }
    }
  }
  return NULL;
}

void SimpleAllocatorFree(SimpleAllocator * sa, const void *data) {
  size_t i;
  uint32_t old_mask, new_mask;
  for (i = 0; i < sa->num_items; i++) {
    if (sa->buf + i*sa->item_sz == data) {
    	do {
    		old_mask = *((volatile uint32_t *) &(sa->empty_mask));
    		new_mask = old_mask & ~(0x1 << i);
    	} while (atomic_cmpxchg_4((int *) &(sa->empty_mask), (int) new_mask, (int) old_mask) != 0);
      return;
    }
  }
}
