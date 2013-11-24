#include "xbee_interface.h"
#include "xbee.h"
#include <stdio.h>
#include <string.h>
#include <inttypes.h>

uint8_t message[] = {0x48, 0x45, 0x4C, 0x4C, 0x4F};

int main() {
	int err;
	volatile int i;
	struct xbee_packet * myPacket;
	err = xbee_interface_init();
	if (err != 0) {
		printf("Unable to successfully initialize xbee interface. Error: %d\r\n", err);
		return 0;
	}

	while (1) {
		myPacket = xbee_interface_create_packet();
		if (!myPacket) {
			printf("Unable to create a new packet\r\n");
			while (1) ;
		}
		memcpy(myPacket->payload, message, sizeof(message));
		myPacket->len = sizeof(message)/sizeof(uint8_t);
		err = xbee_send(myPacket);
		if (err != 0) {
			printf("Error sending packet: %d\r\n", err);
		}
		for (i = 0; i < 1000; i++) ;
	}



}