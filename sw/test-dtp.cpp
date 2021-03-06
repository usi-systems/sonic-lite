/* Copyright (c) 2015 Cornell University
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

#include <stdio.h>
#include <assert.h>

#include "dmaManager.h"
#include "DtpUserRequest.h"
#include "DtpUserIndication.h"
#include "GeneratedTypes.h"

#define NUMBER_OF_TESTS 1

static DtpUserRequestProxy *device = 0;
//static sem_t wait_log;

class DtpUser : public DtpUserIndicationWrapper
{
public:
  virtual void dtp_read_version_resp(uint32_t a) {
    fprintf(stderr, "read version %d\n", a);
  }

  virtual void dtp_read_delay_resp(uint8_t p, uint32_t a) {
    fprintf(stderr, "read delay(%d) %d\n", p, a);
  }
  virtual void dtp_read_state_resp(uint8_t p, uint32_t a) {
    fprintf(stderr, "read state(%d) %d\n", p, a);
  }
  virtual void dtp_read_error_resp(uint8_t p, uint64_t a) {
    fprintf(stderr, "read error(%d) %ld\n", p, a);
  }
  virtual void dtp_read_cnt_resp(uint64_t a) {
    fprintf(stderr, "readCycleCount(%lx)\n", a);
  }
  virtual void dtp_logger_read_cnt_resp(uint8_t a, uint64_t b, uint64_t c, uint64_t d) {
	fprintf(stderr, "read from port(%d) local_cnt(%lx) msg1(%lx) msg2(%lx)\n", a, b, c, d);
  }
  virtual void dtp_read_local_cnt_resp(uint8_t p, uint64_t a) {
	fprintf(stderr, "read from port(%d) local_cnt(%lx)\n", p, a);
  }
  virtual void dtp_read_global_cnt_resp(uint64_t a) {
	fprintf(stderr, "read global_cnt(%lx)\n", a);
  }
  virtual void dtp_read_beacon_interval_resp(uint8_t p, uint32_t a) {
	fprintf(stderr, "read from port(%d) local_cnt(%x)\n", p, a);
  }
  virtual void dtp_debug_rcvd_msg_resp(uint8_t p, uint32_t a, uint32_t b, uint32_t c) {
	fprintf(stderr, "read from port(%d) enq1(%x) enq2(%x) deq(%x)\n", p, a, b, c);
  }
  virtual void dtp_debug_sent_msg_resp(uint8_t p, uint32_t a, uint32_t b, uint32_t c) {
	fprintf(stderr, "read from port(%d) enq(%x) deq1(%x) deq2(%x)\n", p, a, b, c);
  }
  virtual void dtp_debug_rcvd_err_resp(uint8_t p, uint32_t a) {
	fprintf(stderr, "read from port(%d) err(%x)\n", p, a);
  }
  virtual void dtp_get_mode_resp(uint8_t a) {
	fprintf(stderr, "read from mode(%x)\n", a);
  }

  DtpUser(unsigned int id) : DtpUserIndicationWrapper(id) {}
};

int main(int argc, const char **argv)
{
	uint32_t count = 100;
	DtpUser indication(IfcNames_DtpUserIndicationH2S);
	device = new DtpUserRequestProxy(IfcNames_DtpUserRequestS2H);
	device->pint.busyType = BUSY_SPIN;   /* spin until request portal 'notFull' */

	device->dtp_reset(32);
    device->dtp_get_mode();
	device->dtp_read_version();

	fprintf(stderr, "Main::about to go to sleep\n");
	while(true){
		for (int i=0; i<1; i++) {
			device->dtp_read_delay(i);
			device->dtp_read_state(i);
			device->dtp_read_error(i);
			device->dtp_read_cnt(i);
		}
		sleep(1);
		for (int i=0; i<4; i++) {
			device->dtp_logger_write_cnt(i, count);
		}
		for (int i=0; i<4; i++) {
			device->dtp_logger_read_cnt(i);
		}
		count ++;
		sleep(1);
	}
}
