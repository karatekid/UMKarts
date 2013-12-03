#ifndef __MESSAGES_H_
#define __MESSAGES_H_
#include <inttypes.h>

/* Messages have to following fields:
 *  - Message ID (uint8_t)
 *  - Message payload
 * Message length will be stored in the xbee protocol. (Sad face)
 */

#define XBEE_MESSAGE_PRINTF ((uint8_t) 0x00)

void send_message_init();
/**
 * Sends a new message off to all available XBee's.
 */
int send_message(uint8_t message_type, uint8_t * data, uint16_t data_len);
int send_message_address(uint64_t address, uint8_t message_type, uint8_t * data, uint16_t data_len);

#endif /* __MESSAGES_H_ */
