/*-
 * Copyright (c) 2013 Jonathan Woodruff
 * All rights reserved.
 *
 * This software was developed by SRI International and the University of
 * Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-10-C-0237
 * ("CTSRD"), as part of the DARPA CRASH research programme.
 *
 * @BERI_LICENSE_HEADER_START@
 *
 * Licensed to BERI Open Systems C.I.C. (BERI) under one or more contributor
 * license agreements.  See the NOTICE file distributed with this work for
 * additional information regarding copyright ownership.  BERI licenses this
 * file to you under the BERI Hardware-Software License, Version 1.0 (the
 * "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at:
 *
 *   http://www.beri-open-systems.org/legal/license-1-0.txt
 *
 * Unless required by applicable law or agreed to in writing, Work distributed
 * under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations under the License.
 *
 * @BERI_LICENSE_HEADER_END@
 */

import Vector:: *;
import BRAMCore  :: *;

interface BRAM3#(type addr, type data);
   method Action               reqA(addr a);
   method data  respA();
   method Action               reqB(addr a);
   method data  respB();
   method Action              write(addr a, data x);
endinterface

module mkBRAMCore3#(Integer memSize, Bool hasOutputRegister)(BRAM3#(addr, data))
   provisos(Bits#(addr, addr_sz),
            Bits#(data, data_sz));
	
  Vector#(2, BRAM_DUAL_PORT#(addr, data)) brams <- replicateM(mkBRAMCore2(memSize, hasOutputRegister));
  
  method Action reqA(addr a) = brams[0].a.put(False,a,?);
  method data respA() = brams[0].a.read();
  method Action reqB(addr a) = brams[1].a.put(False,a,?);
  method data respB() = brams[1].a.read();

  method Action write(addr a, data x);
    brams[0].b.put(True,a,x);
    brams[1].b.put(True,a,x);
  endmethod
endmodule
