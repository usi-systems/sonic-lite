
// Copyright (c) 2014 Cornell University.

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

package Gearbox_66_40;

import FIFO::*;
import BRAMFIFO::*;
import FIFOF::*;
import Clocks::*;
import SpecialFIFOs::*;
import GetPut::*;
import Vector::*;
import ClientServer::*;

import Connectable::*;
import Pipe::*;

interface Gearbox_66_40;
   interface PipeIn#(Bit#(66)) gbIn;
   interface PipeOut#(Bit#(40)) gbOut;
endinterface

(* synthesize *)
module mkGearbox66to40#(Clock clk_156_25)(Gearbox_66_40);

   let verbose = True;

   Clock defaultClock <- exposeCurrentClock;
   Reset defaultReset <- exposeCurrentReset;
   Reset rst_156_25 <- mkAsyncReset(2, defaultReset, clk_156_25);

   Reg#(Bit#(32)) cycle         <- mkReg(0);
   Vector#(144, Reg#(Bit#(1))) stor <- replicateM(mkReg(0));

   FIFOF#(Bit#(66)) fifo_in <- mkSizedFIFOF(2);
   FIFOF#(Bit#(40)) fifo_out <- mkFIFOF;
   SyncFIFOIfc#(Bit#(66)) synchronizer <- mkSyncBRAMFIFOToCC(10, clk_156_25, rst_156_25);

   Reg#(Bit#(6))  state <- mkReg(0);
   Reg#(Int#(8))  sh_offset <- mkReg(0);
   Reg#(Int#(8))  total <- mkReg(0);

   rule cyc;
      cycle <= cycle + 1;
   endrule

   //Wire#(Bit#(66)) din_wires <- mkDWire(0);
   rule deqSynchronizer;
      let v <- toGet(synchronizer).get;
      //din_wires <= v;
      fifo_in.enq(v);//pack(din_wires));
   endrule

   rule state_machine;
      let next_state = state;
      let curr_total = total;
      let next_total;
      let next_offset;
      let din;// <- toGet(fifo_in).get;

      case (state)
         32:       next_state = 0;
         default:  next_state = next_state + 1;
      endcase

      if (state == 0) begin
         curr_total = 66;
      end

      if (curr_total - 40 >= 40) begin
         next_total = curr_total - 40;
      end
      else begin
         next_total = curr_total - 40 + 66;
      end

      if (curr_total - 40 >= 40) begin
         next_offset = 0;
      end
      else begin
         next_offset = curr_total - 40;
      end

      if(verbose) $display("%d: state %h, curr_total = %d, next_offset = %d, next_total=%d", cycle, state, curr_total, next_offset, next_total);

      if (state == 0) begin
         din <- toGet(fifo_in).get;
      end
      else begin
         if (sh_offset != 0) begin
            din <- toGet(fifo_in).get;
         end
         else begin
            din = unpack(0);
         end
      end
      if(verbose) $display("%d: state %h, sh_offset=%d din=%h stor=%h", cycle, state, sh_offset, din, readVReg(stor));

      function Bit#(1) value_stor(Integer i);
         Bit#(1) v = 0;
         Bool shift40;
         if (state == 0) begin
            shift40 = False;
         end
         else begin
            shift40 = (sh_offset == 0);
         end

         if (shift40) begin
            if (fromInteger(i) < 64) begin
               v = readVReg(stor)[40+i];
            end
            else begin
               v = 0;
            end
         end
         else begin
            if (fromInteger(i) < sh_offset) begin
               v = readVReg(stor)[40+i];
            end
            else if (fromInteger(i) < sh_offset + 66) begin
               v = din[fromInteger(i)-sh_offset];
            end
            else begin
               v = 0;
            end
         end
         return v;
      endfunction
      Vector#(104, Bit#(1)) next_stor = genWith(value_stor);
      if(verbose) $display("%d: state %h, stor=%h", cycle, state, next_stor);
      writeVReg(take(stor), next_stor);

      if (fifo_out.notFull) begin
         fifo_out.enq(pack(next_stor)[39:0]);
      end

      total <= next_total;
      sh_offset <= next_offset;
      state <= next_state;
   endrule

   interface gbIn = toPipeIn(synchronizer);//fifo_in);
   interface gbOut = toPipeOut(fifo_out);
endmodule
endpackage

//Reference: 
//always @(posedge clk) begin
//	din_r <= din[65:0];
//	
//	gbstate <= (sclr | gbstate[5]) ? 6'h0 : (gbstate + 1'b1);
//	   
//	if (gbstate[5]) begin 
//		stor <= {40'h0,stor[103:40]};    // holding 0	
//	end    
//	else begin	
//		case (gbstate[4:0])
//			5'h0 : begin stor[65:0] <= din[65:0];  end   // holding 26
//			5'h1 : begin stor[91:26] <= din[65:0]; stor[25:0] <= stor[65:40];   end   // holding 52
//			5'h2 : begin stor <= {40'h0,stor[103:40]};  end   // holding 12
//			5'h3 : begin stor[77:12] <= din[65:0]; stor[11:0] <= stor[51:40];   end   // holding 38
//			5'h4 : begin stor[103:38] <= din[65:0]; stor[37:0] <= stor[77:40];   end   // holding 64
//			5'h5 : begin stor <= {40'h0,stor[103:40]};  end   // holding 24
//			5'h6 : begin stor[89:24] <= din[65:0]; stor[23:0] <= stor[63:40];   end   // holding 50
//			5'h7 : begin stor <= {40'h0,stor[103:40]};  end   // holding 10
//			5'h8 : begin stor[75:10] <= din[65:0]; stor[9:0] <= stor[49:40];   end   // holding 36
//			5'h9 : begin stor[101:36] <= din[65:0]; stor[35:0] <= stor[75:40];   end   // holding 62
//			5'ha : begin stor <= {40'h0,stor[103:40]};  end   // holding 22
//			5'hb : begin stor[87:22] <= din[65:0]; stor[21:0] <= stor[61:40];   end   // holding 48
//			5'hc : begin stor <= {40'h0,stor[103:40]};  end   // holding 8
//			5'hd : begin stor[73:8] <= din[65:0]; stor[7:0] <= stor[47:40];   end   // holding 34
//			5'he : begin stor[99:34] <= din[65:0]; stor[33:0] <= stor[73:40];   end   // holding 60
//			5'hf : begin stor <= {40'h0,stor[103:40]};  end   // holding 20
//			5'h10 : begin stor[85:20] <= din[65:0]; stor[19:0] <= stor[59:40];   end   // holding 46
//			5'h11 : begin stor <= {40'h0,stor[103:40]};  end   // holding 6
//			5'h12 : begin stor[71:6] <= din[65:0]; stor[5:0] <= stor[45:40];   end   // holding 32
//			5'h13 : begin stor[97:32] <= din[65:0]; stor[31:0] <= stor[71:40];   end   // holding 58
//			5'h14 : begin stor <= {40'h0,stor[103:40]};  end   // holding 18
//			5'h15 : begin stor[83:18] <= din[65:0]; stor[17:0] <= stor[57:40];   end   // holding 44
//			5'h16 : begin stor <= {40'h0,stor[103:40]};  end   // holding 4
//			5'h17 : begin stor[69:4] <= din[65:0]; stor[3:0] <= stor[43:40];   end   // holding 30
//			5'h18 : begin stor[95:30] <= din[65:0]; stor[29:0] <= stor[69:40];   end   // holding 56
//			5'h19 : begin stor <= {40'h0,stor[103:40]};  end   // holding 16
//			5'h1a : begin stor[81:16] <= din[65:0]; stor[15:0] <= stor[55:40];   end   // holding 42
//			5'h1b : begin stor <= {40'h0,stor[103:40]};  end   // holding 2
//			5'h1c : begin stor[67:2] <= din[65:0]; stor[1:0] <= stor[41:40];   end   // holding 28
//			5'h1d : begin stor[93:28] <= din[65:0]; stor[27:0] <= stor[67:40];   end   // holding 54
//			5'h1e : begin stor <= {40'h0,stor[103:40]};  end   // holding 14
//			5'h1f : begin stor[79:14] <= din[65:0]; stor[13:0] <= stor[53:40];   end   // holding 40
//			5'h20 : begin stor <= {40'h0, stor[103:40]};   end   // holding 40
//		endcase
//	end
//end
//
//
