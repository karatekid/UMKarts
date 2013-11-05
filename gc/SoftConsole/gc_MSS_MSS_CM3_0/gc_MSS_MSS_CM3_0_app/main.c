#include <stdio.h>
#include <stdint.h>
#include "mytimer.h"
#include "drivers/mss_uart/mss_uart.h"

typedef struct
{
	_Bool empty1 : 1;
    _Bool empty2 : 1;
    _Bool empty3 : 1;
    _Bool start : 1;
    _Bool y : 1;
    _Bool x : 1;
    _Bool b : 1;
    _Bool a : 1;

	_Bool empty4 : 1;
    _Bool l : 1;
    _Bool r : 1;
    _Bool z : 1;
    _Bool d_up : 1;
    _Bool d_down : 1;
    _Bool d_right : 1;
    _Bool d_left : 1;


    int8_t joystick_x : 8;
    int8_t joystick_y : 8;


    int8_t cstick_x : 8;
    int8_t cstick_y : 8;


	int8_t left : 8;
	int8_t right : 8;




} gc_t;

gc_t * GC;
volatile uint32_t count;
volatile uint32_t period, cmpVal;
volatile int curClock, prevClock;
const double CONVERSION_FACTOR = 0.00017006802;
int lastVals[10];
int arrCount=0;


// Range between -1 and 1
void setPWM(double percentage) {
	volatile uint32_t lengthOfLow;
	int isNegative = percentage < 0;
	if(isNegative) {
		percentage *= -1;
		MYTIMER_set_motor_direction(-1);
	}
	else {
		MYTIMER_set_motor_direction(1);
	}
	if(percentage < 0.125) {
		MYTIMER_set_motor_direction(0);
	}
	lengthOfLow = period*(1-percentage);
	if(percentage <= 1 && percentage >= -1) {
		MYTIMER_setCompareVal(lengthOfLow);
	}
}

__attribute__ ((interrupt)) void Fabric_IRQHandler( void )
{

    //uint32_t time = MYTIMER_getCounterVal();
    uint32_t status = MYTIMER_getInterrupt_status();
    /*
    int diff;
    //uint32_t async_out = MYTIMER_get_async_capture();
    prevClock = curClock;
    curClock = MYTIMER_get_sync_capture();
    lastVals[(arrCount = (arrCount+1)%10)] = curClock;
    //curClock = MYTIMER_getCounterVal();
    diff = curClock - prevClock;
    if(diff < 0)
    	diff += period;
	count--;
	if(diff < 1500000)
		printf("%f Inches \n\r", diff*CONVERSION_FACTOR);
	*/
    //printf("Interrupt occurred at %lu FABINT \n\r", time);
    //printf("Status = %lu \n\r", status);
	/*
	printf("%d Prev \n\r", prevClock);
	printf("%d Cur \n\r", curClock);
    printf("%d Inches \n\r", diff);
    */
    printf("%d Count \n\r", (int)count);
    if(status & 0x01 && count > 1000)
    {
        setPWM(.5);
        count = 0;
    }
    /*
    if(status & 0x02)
    {
        printf("Compare latency %ld\n\r", (1<<27) - time);
    }
    if(status == 12)
    {
    	printf("Sync time: %ld, Async time: %ld, diff: %ld\n\r", sync_out, async_out, sync_out - async_out);
    }
    */
    count ++;
    NVIC_ClearPendingIRQ( Fabric_IRQn );
}

void print_gc() {
	if (GC->start)
		printf("Start ");
	if (GC->y)
		printf("Y ");
	if (GC->x)
		printf("X ");
	if (GC->b)
		printf("B ");
	if (GC->a)
		printf("A ");
	if (GC->l)
		printf("L ");
	if (GC->r)
		printf("R ");
	if (GC->z)
		printf("Z ");
	if (GC->d_up)
		printf("UP ");
	if (GC->d_down)
		printf("DOWN ");
	if (GC->d_right)
		printf("RIGHT ");
	if (GC->d_left)
		printf("LEFT ");
	printf("\n\r");
	printf("Joystick X: %d, Y: %d\n\r", GC->joystick_x, GC->joystick_y);
	printf("C stick X: %d, Y: %d\n\r", GC->cstick_x, GC->cstick_y);
	printf("Trigger Pressure Left: %d, Right: %d\n\r\n\r", GC->left, GC->right);
}

int main()
{
	volatile int d = 0;
	uint32_t *mem = (uint32_t *) malloc(8);
	GC = (gc_t *) mem;
	cmpVal = 200000;
	period = 2000000;
	curClock = prevClock = 0;
   /* Setup MYTIMER */
	MYTIMER_init();
	MYTIMER_setOverflowVal(period);
	MYTIMER_setCompareVal(cmpVal);
	setPWM(.25);
	MYTIMER_set_servo_direction(1);
	//MYTIMER_setCompareVal(2034);

	MYTIMER_enable_overflowInt();
	MYTIMER_enable_compareInt();
	MYTIMER_enable_allInterrupts();
	MYTIMER_enable_pwm();
	MYTIMER_enable_capture();

	NVIC_EnableIRQ(Fabric_IRQn);

	MYTIMER_enable();
	printf("HEY\n");
	count = 0;
	int lastVal = 1;
	double speed = 0;
	int dir = 1;

	// Write to send wavebird init command
	*((volatile int *) 0x40050000) = 0;

	while( 1 )
	{
		mem[0] = (volatile int) *((volatile int *)0x40050000);
		mem[1] = (volatile int) *((volatile int *)0x40050004);
		print_gc();
		if(GC->a) {
			setPWM(0.5);
		}
		else if(GC->b) {
			setPWM(-0.5);
		}
		else {
			setPWM(0);
		}

		if(GC->d_right) {
			MYTIMER_set_servo_direction(1);
		}
		else if(GC->d_left) {
			MYTIMER_set_servo_direction(-1);
		}
		else {
			MYTIMER_set_servo_direction(0);
		}
		for (d = 0; d < 1000000; d++);//*((volatile int *) 0x40050000) = 0;
	}
}