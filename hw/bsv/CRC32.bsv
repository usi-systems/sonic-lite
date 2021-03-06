
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

package CRC32;

  // polynomial: (0 1 2 4 5 7 8 10 11 12 16 22 23 26 32)
  // data width: 64
  // convention: the first serial data bit is D[63]
  function Bit#(32) nextCRC32_D64(Bit#(64) data, Bit#(32) crc);

    Bit#(64) d;
    Bit#(32) c;
    Bit#(32) newCrc;

    d = data;
    c = crc;

    newCrc[0] = d[63] ^ d[61] ^ d[60] ^ d[58] ^ d[55] ^ d[54] ^ d[53] ^ 
                d[50] ^ d[48] ^ d[47] ^ d[45] ^ d[44] ^ d[37] ^ d[34] ^ 
                d[32] ^ d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[26] ^ d[25] ^ 
                d[24] ^ d[16] ^ d[12] ^ d[10] ^ d[9] ^ d[6] ^ d[0] ^ 
                c[0] ^ c[2] ^ c[5] ^ c[12] ^ c[13] ^ c[15] ^ c[16] ^ 
                c[18] ^ c[21] ^ c[22] ^ c[23] ^ c[26] ^ c[28] ^ c[29] ^ 
                c[31];
    newCrc[1] = d[63] ^ d[62] ^ d[60] ^ d[59] ^ d[58] ^ d[56] ^ d[53] ^ 
                d[51] ^ d[50] ^ d[49] ^ d[47] ^ d[46] ^ d[44] ^ d[38] ^ 
                d[37] ^ d[35] ^ d[34] ^ d[33] ^ d[28] ^ d[27] ^ d[24] ^ 
                d[17] ^ d[16] ^ d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[7] ^ 
                d[6] ^ d[1] ^ d[0] ^ c[1] ^ c[2] ^ c[3] ^ c[5] ^ c[6] ^ 
                c[12] ^ c[14] ^ c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[21] ^ 
                c[24] ^ c[26] ^ c[27] ^ c[28] ^ c[30] ^ c[31];
    newCrc[2] = d[59] ^ d[58] ^ d[57] ^ d[55] ^ d[53] ^ d[52] ^ d[51] ^ 
                d[44] ^ d[39] ^ d[38] ^ d[37] ^ d[36] ^ d[35] ^ d[32] ^ 
                d[31] ^ d[30] ^ d[26] ^ d[24] ^ d[18] ^ d[17] ^ d[16] ^ 
                d[14] ^ d[13] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[2] ^ 
                d[1] ^ d[0] ^ c[0] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ 
                c[12] ^ c[19] ^ c[20] ^ c[21] ^ c[23] ^ c[25] ^ c[26] ^ 
                c[27];
    newCrc[3] = d[60] ^ d[59] ^ d[58] ^ d[56] ^ d[54] ^ d[53] ^ d[52] ^ 
                d[45] ^ d[40] ^ d[39] ^ d[38] ^ d[37] ^ d[36] ^ d[33] ^ 
                d[32] ^ d[31] ^ d[27] ^ d[25] ^ d[19] ^ d[18] ^ d[17] ^ 
                d[15] ^ d[14] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[3] ^ 
                d[2] ^ d[1] ^ c[0] ^ c[1] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ 
                c[8] ^ c[13] ^ c[20] ^ c[21] ^ c[22] ^ c[24] ^ c[26] ^ 
                c[27] ^ c[28];
    newCrc[4] = d[63] ^ d[59] ^ d[58] ^ d[57] ^ d[50] ^ d[48] ^ d[47] ^ 
                d[46] ^ d[45] ^ d[44] ^ d[41] ^ d[40] ^ d[39] ^ d[38] ^ 
                d[33] ^ d[31] ^ d[30] ^ d[29] ^ d[25] ^ d[24] ^ d[20] ^ 
                d[19] ^ d[18] ^ d[15] ^ d[12] ^ d[11] ^ d[8] ^ d[6] ^ 
                d[4] ^ d[3] ^ d[2] ^ d[0] ^ c[1] ^ c[6] ^ c[7] ^ c[8] ^ 
                c[9] ^ c[12] ^ c[13] ^ c[14] ^ c[15] ^ c[16] ^ c[18] ^ 
                c[25] ^ c[26] ^ c[27] ^ c[31];
    newCrc[5] = d[63] ^ d[61] ^ d[59] ^ d[55] ^ d[54] ^ d[53] ^ d[51] ^ 
                d[50] ^ d[49] ^ d[46] ^ d[44] ^ d[42] ^ d[41] ^ d[40] ^ 
                d[39] ^ d[37] ^ d[29] ^ d[28] ^ d[24] ^ d[21] ^ d[20] ^ 
                d[19] ^ d[13] ^ d[10] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ 
                d[3] ^ d[1] ^ d[0] ^ c[5] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ 
                c[12] ^ c[14] ^ c[17] ^ c[18] ^ c[19] ^ c[21] ^ c[22] ^ 
                c[23] ^ c[27] ^ c[29] ^ c[31];
    newCrc[6] = d[62] ^ d[60] ^ d[56] ^ d[55] ^ d[54] ^ d[52] ^ d[51] ^ 
                d[50] ^ d[47] ^ d[45] ^ d[43] ^ d[42] ^ d[41] ^ d[40] ^ 
                d[38] ^ d[30] ^ d[29] ^ d[25] ^ d[22] ^ d[21] ^ d[20] ^ 
                d[14] ^ d[11] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ 
                d[2] ^ d[1] ^ c[6] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ 
                c[13] ^ c[15] ^ c[18] ^ c[19] ^ c[20] ^ c[22] ^ c[23] ^ 
                c[24] ^ c[28] ^ c[30];
    newCrc[7] = d[60] ^ d[58] ^ d[57] ^ d[56] ^ d[54] ^ d[52] ^ d[51] ^ 
                d[50] ^ d[47] ^ d[46] ^ d[45] ^ d[43] ^ d[42] ^ d[41] ^ 
                d[39] ^ d[37] ^ d[34] ^ d[32] ^ d[29] ^ d[28] ^ d[25] ^ 
                d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[16] ^ d[15] ^ d[10] ^ 
                d[8] ^ d[7] ^ d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[2] ^ 
                c[5] ^ c[7] ^ c[9] ^ c[10] ^ c[11] ^ c[13] ^ c[14] ^ 
                c[15] ^ c[18] ^ c[19] ^ c[20] ^ c[22] ^ c[24] ^ c[25] ^ 
                c[26] ^ c[28];
    newCrc[8] = d[63] ^ d[60] ^ d[59] ^ d[57] ^ d[54] ^ d[52] ^ d[51] ^ 
                d[50] ^ d[46] ^ d[45] ^ d[43] ^ d[42] ^ d[40] ^ d[38] ^ 
                d[37] ^ d[35] ^ d[34] ^ d[33] ^ d[32] ^ d[31] ^ d[28] ^ 
                d[23] ^ d[22] ^ d[17] ^ d[12] ^ d[11] ^ d[10] ^ d[8] ^ 
                d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ 
                c[5] ^ c[6] ^ c[8] ^ c[10] ^ c[11] ^ c[13] ^ c[14] ^ 
                c[18] ^ c[19] ^ c[20] ^ c[22] ^ c[25] ^ c[27] ^ c[28] ^ 
                c[31];
    newCrc[9] = d[61] ^ d[60] ^ d[58] ^ d[55] ^ d[53] ^ d[52] ^ d[51] ^ 
                d[47] ^ d[46] ^ d[44] ^ d[43] ^ d[41] ^ d[39] ^ d[38] ^ 
                d[36] ^ d[35] ^ d[34] ^ d[33] ^ d[32] ^ d[29] ^ d[24] ^ 
                d[23] ^ d[18] ^ d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[5] ^ 
                d[4] ^ d[2] ^ d[1] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ 
                c[6] ^ c[7] ^ c[9] ^ c[11] ^ c[12] ^ c[14] ^ c[15] ^ 
                c[19] ^ c[20] ^ c[21] ^ c[23] ^ c[26] ^ c[28] ^ c[29];
    newCrc[10] = d[63] ^ d[62] ^ d[60] ^ d[59] ^ d[58] ^ d[56] ^ d[55] ^ 
                 d[52] ^ d[50] ^ d[42] ^ d[40] ^ d[39] ^ d[36] ^ d[35] ^ 
                 d[33] ^ d[32] ^ d[31] ^ d[29] ^ d[28] ^ d[26] ^ d[19] ^ 
                 d[16] ^ d[14] ^ d[13] ^ d[9] ^ d[5] ^ d[3] ^ d[2] ^ 
                 d[0] ^ c[0] ^ c[1] ^ c[3] ^ c[4] ^ c[7] ^ c[8] ^ c[10] ^ 
                 c[18] ^ c[20] ^ c[23] ^ c[24] ^ c[26] ^ c[27] ^ c[28] ^ 
                 c[30] ^ c[31];
    newCrc[11] = d[59] ^ d[58] ^ d[57] ^ d[56] ^ d[55] ^ d[54] ^ d[51] ^ 
                 d[50] ^ d[48] ^ d[47] ^ d[45] ^ d[44] ^ d[43] ^ d[41] ^ 
                 d[40] ^ d[36] ^ d[33] ^ d[31] ^ d[28] ^ d[27] ^ d[26] ^ 
                 d[25] ^ d[24] ^ d[20] ^ d[17] ^ d[16] ^ d[15] ^ d[14] ^ 
                 d[12] ^ d[9] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[1] ^ c[4] ^ 
                 c[8] ^ c[9] ^ c[11] ^ c[12] ^ c[13] ^ c[15] ^ c[16] ^ 
                 c[18] ^ c[19] ^ c[22] ^ c[23] ^ c[24] ^ c[25] ^ c[26] ^ 
                 c[27];
    newCrc[12] = d[63] ^ d[61] ^ d[59] ^ d[57] ^ d[56] ^ d[54] ^ d[53] ^ 
                 d[52] ^ d[51] ^ d[50] ^ d[49] ^ d[47] ^ d[46] ^ d[42] ^ 
                 d[41] ^ d[31] ^ d[30] ^ d[27] ^ d[24] ^ d[21] ^ d[18] ^ 
                 d[17] ^ d[15] ^ d[13] ^ d[12] ^ d[9] ^ d[6] ^ d[5] ^ 
                 d[4] ^ d[2] ^ d[1] ^ d[0] ^ c[9] ^ c[10] ^ c[14] ^ 
                 c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[20] ^ c[21] ^ c[22] ^ 
                 c[24] ^ c[25] ^ c[27] ^ c[29] ^ c[31];
    newCrc[13] = d[62] ^ d[60] ^ d[58] ^ d[57] ^ d[55] ^ d[54] ^ d[53] ^ 
                 d[52] ^ d[51] ^ d[50] ^ d[48] ^ d[47] ^ d[43] ^ d[42] ^ 
                 d[32] ^ d[31] ^ d[28] ^ d[25] ^ d[22] ^ d[19] ^ d[18] ^ 
                 d[16] ^ d[14] ^ d[13] ^ d[10] ^ d[7] ^ d[6] ^ d[5] ^ 
                 d[3] ^ d[2] ^ d[1] ^ c[0] ^ c[10] ^ c[11] ^ c[15] ^ 
                 c[16] ^ c[18] ^ c[19] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^ 
                 c[25] ^ c[26] ^ c[28] ^ c[30];
    newCrc[14] = d[63] ^ d[61] ^ d[59] ^ d[58] ^ d[56] ^ d[55] ^ d[54] ^ 
                 d[53] ^ d[52] ^ d[51] ^ d[49] ^ d[48] ^ d[44] ^ d[43] ^ 
                 d[33] ^ d[32] ^ d[29] ^ d[26] ^ d[23] ^ d[20] ^ d[19] ^ 
                 d[17] ^ d[15] ^ d[14] ^ d[11] ^ d[8] ^ d[7] ^ d[6] ^ 
                 d[4] ^ d[3] ^ d[2] ^ c[0] ^ c[1] ^ c[11] ^ c[12] ^ 
                 c[16] ^ c[17] ^ c[19] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^ 
                 c[24] ^ c[26] ^ c[27] ^ c[29] ^ c[31];
    newCrc[15] = d[62] ^ d[60] ^ d[59] ^ d[57] ^ d[56] ^ d[55] ^ d[54] ^ 
                 d[53] ^ d[52] ^ d[50] ^ d[49] ^ d[45] ^ d[44] ^ d[34] ^ 
                 d[33] ^ d[30] ^ d[27] ^ d[24] ^ d[21] ^ d[20] ^ d[18] ^ 
                 d[16] ^ d[15] ^ d[12] ^ d[9] ^ d[8] ^ d[7] ^ d[5] ^ 
                 d[4] ^ d[3] ^ c[1] ^ c[2] ^ c[12] ^ c[13] ^ c[17] ^ 
                 c[18] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^ c[24] ^ c[25] ^ 
                 c[27] ^ c[28] ^ c[30];
    newCrc[16] = d[57] ^ d[56] ^ d[51] ^ d[48] ^ d[47] ^ d[46] ^ d[44] ^ 
                 d[37] ^ d[35] ^ d[32] ^ d[30] ^ d[29] ^ d[26] ^ d[24] ^ 
                 d[22] ^ d[21] ^ d[19] ^ d[17] ^ d[13] ^ d[12] ^ d[8] ^ 
                 d[5] ^ d[4] ^ d[0] ^ c[0] ^ c[3] ^ c[5] ^ c[12] ^ c[14] ^ 
                 c[15] ^ c[16] ^ c[19] ^ c[24] ^ c[25];
    newCrc[17] = d[58] ^ d[57] ^ d[52] ^ d[49] ^ d[48] ^ d[47] ^ d[45] ^ 
                 d[38] ^ d[36] ^ d[33] ^ d[31] ^ d[30] ^ d[27] ^ d[25] ^ 
                 d[23] ^ d[22] ^ d[20] ^ d[18] ^ d[14] ^ d[13] ^ d[9] ^ 
                 d[6] ^ d[5] ^ d[1] ^ c[1] ^ c[4] ^ c[6] ^ c[13] ^ c[15] ^ 
                 c[16] ^ c[17] ^ c[20] ^ c[25] ^ c[26];
    newCrc[18] = d[59] ^ d[58] ^ d[53] ^ d[50] ^ d[49] ^ d[48] ^ d[46] ^ 
                 d[39] ^ d[37] ^ d[34] ^ d[32] ^ d[31] ^ d[28] ^ d[26] ^ 
                 d[24] ^ d[23] ^ d[21] ^ d[19] ^ d[15] ^ d[14] ^ d[10] ^ 
                 d[7] ^ d[6] ^ d[2] ^ c[0] ^ c[2] ^ c[5] ^ c[7] ^ c[14] ^ 
                 c[16] ^ c[17] ^ c[18] ^ c[21] ^ c[26] ^ c[27];
    newCrc[19] = d[60] ^ d[59] ^ d[54] ^ d[51] ^ d[50] ^ d[49] ^ d[47] ^ 
                 d[40] ^ d[38] ^ d[35] ^ d[33] ^ d[32] ^ d[29] ^ d[27] ^ 
                 d[25] ^ d[24] ^ d[22] ^ d[20] ^ d[16] ^ d[15] ^ d[11] ^ 
                 d[8] ^ d[7] ^ d[3] ^ c[0] ^ c[1] ^ c[3] ^ c[6] ^ c[8] ^ 
                 c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[22] ^ c[27] ^ c[28];
    newCrc[20] = d[61] ^ d[60] ^ d[55] ^ d[52] ^ d[51] ^ d[50] ^ d[48] ^ 
                 d[41] ^ d[39] ^ d[36] ^ d[34] ^ d[33] ^ d[30] ^ d[28] ^ 
                 d[26] ^ d[25] ^ d[23] ^ d[21] ^ d[17] ^ d[16] ^ d[12] ^ 
                 d[9] ^ d[8] ^ d[4] ^ c[1] ^ c[2] ^ c[4] ^ c[7] ^ c[9] ^ 
                 c[16] ^ c[18] ^ c[19] ^ c[20] ^ c[23] ^ c[28] ^ c[29];
    newCrc[21] = d[62] ^ d[61] ^ d[56] ^ d[53] ^ d[52] ^ d[51] ^ d[49] ^ 
                 d[42] ^ d[40] ^ d[37] ^ d[35] ^ d[34] ^ d[31] ^ d[29] ^ 
                 d[27] ^ d[26] ^ d[24] ^ d[22] ^ d[18] ^ d[17] ^ d[13] ^ 
                 d[10] ^ d[9] ^ d[5] ^ c[2] ^ c[3] ^ c[5] ^ c[8] ^ c[10] ^ 
                 c[17] ^ c[19] ^ c[20] ^ c[21] ^ c[24] ^ c[29] ^ c[30];
    newCrc[22] = d[62] ^ d[61] ^ d[60] ^ d[58] ^ d[57] ^ d[55] ^ d[52] ^ 
                 d[48] ^ d[47] ^ d[45] ^ d[44] ^ d[43] ^ d[41] ^ d[38] ^ 
                 d[37] ^ d[36] ^ d[35] ^ d[34] ^ d[31] ^ d[29] ^ d[27] ^ 
                 d[26] ^ d[24] ^ d[23] ^ d[19] ^ d[18] ^ d[16] ^ d[14] ^ 
                 d[12] ^ d[11] ^ d[9] ^ d[0] ^ c[2] ^ c[3] ^ c[4] ^ 
                 c[5] ^ c[6] ^ c[9] ^ c[11] ^ c[12] ^ c[13] ^ c[15] ^ 
                 c[16] ^ c[20] ^ c[23] ^ c[25] ^ c[26] ^ c[28] ^ c[29] ^ 
                 c[30];
    newCrc[23] = d[62] ^ d[60] ^ d[59] ^ d[56] ^ d[55] ^ d[54] ^ d[50] ^ 
                 d[49] ^ d[47] ^ d[46] ^ d[42] ^ d[39] ^ d[38] ^ d[36] ^ 
                 d[35] ^ d[34] ^ d[31] ^ d[29] ^ d[27] ^ d[26] ^ d[20] ^ 
                 d[19] ^ d[17] ^ d[16] ^ d[15] ^ d[13] ^ d[9] ^ d[6] ^ 
                 d[1] ^ d[0] ^ c[2] ^ c[3] ^ c[4] ^ c[6] ^ c[7] ^ c[10] ^ 
                 c[14] ^ c[15] ^ c[17] ^ c[18] ^ c[22] ^ c[23] ^ c[24] ^ 
                 c[27] ^ c[28] ^ c[30];
    newCrc[24] = d[63] ^ d[61] ^ d[60] ^ d[57] ^ d[56] ^ d[55] ^ d[51] ^ 
                 d[50] ^ d[48] ^ d[47] ^ d[43] ^ d[40] ^ d[39] ^ d[37] ^ 
                 d[36] ^ d[35] ^ d[32] ^ d[30] ^ d[28] ^ d[27] ^ d[21] ^ 
                 d[20] ^ d[18] ^ d[17] ^ d[16] ^ d[14] ^ d[10] ^ d[7] ^ 
                 d[2] ^ d[1] ^ c[0] ^ c[3] ^ c[4] ^ c[5] ^ c[7] ^ c[8] ^ 
                 c[11] ^ c[15] ^ c[16] ^ c[18] ^ c[19] ^ c[23] ^ c[24] ^ 
                 c[25] ^ c[28] ^ c[29] ^ c[31];
    newCrc[25] = d[62] ^ d[61] ^ d[58] ^ d[57] ^ d[56] ^ d[52] ^ d[51] ^ 
                 d[49] ^ d[48] ^ d[44] ^ d[41] ^ d[40] ^ d[38] ^ d[37] ^ 
                 d[36] ^ d[33] ^ d[31] ^ d[29] ^ d[28] ^ d[22] ^ d[21] ^ 
                 d[19] ^ d[18] ^ d[17] ^ d[15] ^ d[11] ^ d[8] ^ d[3] ^ 
                 d[2] ^ c[1] ^ c[4] ^ c[5] ^ c[6] ^ c[8] ^ c[9] ^ c[12] ^ 
                 c[16] ^ c[17] ^ c[19] ^ c[20] ^ c[24] ^ c[25] ^ c[26] ^ 
                 c[29] ^ c[30];
    newCrc[26] = d[62] ^ d[61] ^ d[60] ^ d[59] ^ d[57] ^ d[55] ^ d[54] ^ 
                 d[52] ^ d[49] ^ d[48] ^ d[47] ^ d[44] ^ d[42] ^ d[41] ^ 
                 d[39] ^ d[38] ^ d[31] ^ d[28] ^ d[26] ^ d[25] ^ d[24] ^ 
                 d[23] ^ d[22] ^ d[20] ^ d[19] ^ d[18] ^ d[10] ^ d[6] ^ 
                 d[4] ^ d[3] ^ d[0] ^ c[6] ^ c[7] ^ c[9] ^ c[10] ^ c[12] ^ 
                 c[15] ^ c[16] ^ c[17] ^ c[20] ^ c[22] ^ c[23] ^ c[25] ^ 
                 c[27] ^ c[28] ^ c[29] ^ c[30];
    newCrc[27] = d[63] ^ d[62] ^ d[61] ^ d[60] ^ d[58] ^ d[56] ^ d[55] ^ 
                 d[53] ^ d[50] ^ d[49] ^ d[48] ^ d[45] ^ d[43] ^ d[42] ^ 
                 d[40] ^ d[39] ^ d[32] ^ d[29] ^ d[27] ^ d[26] ^ d[25] ^ 
                 d[24] ^ d[23] ^ d[21] ^ d[20] ^ d[19] ^ d[11] ^ d[7] ^ 
                 d[5] ^ d[4] ^ d[1] ^ c[0] ^ c[7] ^ c[8] ^ c[10] ^ c[11] ^ 
                 c[13] ^ c[16] ^ c[17] ^ c[18] ^ c[21] ^ c[23] ^ c[24] ^ 
                 c[26] ^ c[28] ^ c[29] ^ c[30] ^ c[31];
    newCrc[28] = d[63] ^ d[62] ^ d[61] ^ d[59] ^ d[57] ^ d[56] ^ d[54] ^ 
                 d[51] ^ d[50] ^ d[49] ^ d[46] ^ d[44] ^ d[43] ^ d[41] ^ 
                 d[40] ^ d[33] ^ d[30] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ 
                 d[24] ^ d[22] ^ d[21] ^ d[20] ^ d[12] ^ d[8] ^ d[6] ^ 
                 d[5] ^ d[2] ^ c[1] ^ c[8] ^ c[9] ^ c[11] ^ c[12] ^ 
                 c[14] ^ c[17] ^ c[18] ^ c[19] ^ c[22] ^ c[24] ^ c[25] ^ 
                 c[27] ^ c[29] ^ c[30] ^ c[31];
    newCrc[29] = d[63] ^ d[62] ^ d[60] ^ d[58] ^ d[57] ^ d[55] ^ d[52] ^ 
                 d[51] ^ d[50] ^ d[47] ^ d[45] ^ d[44] ^ d[42] ^ d[41] ^ 
                 d[34] ^ d[31] ^ d[29] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ 
                 d[23] ^ d[22] ^ d[21] ^ d[13] ^ d[9] ^ d[7] ^ d[6] ^ 
                 d[3] ^ c[2] ^ c[9] ^ c[10] ^ c[12] ^ c[13] ^ c[15] ^ 
                 c[18] ^ c[19] ^ c[20] ^ c[23] ^ c[25] ^ c[26] ^ c[28] ^ 
                 c[30] ^ c[31];
    newCrc[30] = d[63] ^ d[61] ^ d[59] ^ d[58] ^ d[56] ^ d[53] ^ d[52] ^ 
                 d[51] ^ d[48] ^ d[46] ^ d[45] ^ d[43] ^ d[42] ^ d[35] ^ 
                 d[32] ^ d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[26] ^ d[24] ^ 
                 d[23] ^ d[22] ^ d[14] ^ d[10] ^ d[8] ^ d[7] ^ d[4] ^ 
                 c[0] ^ c[3] ^ c[10] ^ c[11] ^ c[13] ^ c[14] ^ c[16] ^ 
                 c[19] ^ c[20] ^ c[21] ^ c[24] ^ c[26] ^ c[27] ^ c[29] ^ 
                 c[31];
    newCrc[31] = d[62] ^ d[60] ^ d[59] ^ d[57] ^ d[54] ^ d[53] ^ d[52] ^ 
                 d[49] ^ d[47] ^ d[46] ^ d[44] ^ d[43] ^ d[36] ^ d[33] ^ 
                 d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[25] ^ d[24] ^ 
                 d[23] ^ d[15] ^ d[11] ^ d[9] ^ d[8] ^ d[5] ^ c[1] ^ 
                 c[4] ^ c[11] ^ c[12] ^ c[14] ^ c[15] ^ c[17] ^ c[20] ^ 
                 c[21] ^ c[22] ^ c[25] ^ c[27] ^ c[28] ^ c[30];

    return newCrc;
  endfunction

  // polynomial: (0 1 2 4 5 7 8 10 11 12 16 22 23 26 32)
  // data width: 8
  // convention: the first serial data bit is D[7]
  function Bit#(32) nextCRC32_D8(Bit#(8) data, Bit#(32) crc);
    Bit#(8) d;
    Bit#(32) c;
    Bit#(32) newCrc;

    d = data;
    c = crc;

    newCrc[0] = d[6] ^ d[0] ^ c[24] ^ c[30];
    newCrc[1] = d[7] ^ d[6] ^ d[1] ^ d[0] ^ c[24] ^ c[25] ^ c[30] ^ 
                c[31];
    newCrc[2] = d[7] ^ d[6] ^ d[2] ^ d[1] ^ d[0] ^ c[24] ^ c[25] ^ 
                c[26] ^ c[30] ^ c[31];
    newCrc[3] = d[7] ^ d[3] ^ d[2] ^ d[1] ^ c[25] ^ c[26] ^ c[27] ^ 
                c[31];
    newCrc[4] = d[6] ^ d[4] ^ d[3] ^ d[2] ^ d[0] ^ c[24] ^ c[26] ^ 
                c[27] ^ c[28] ^ c[30];
    newCrc[5] = d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[24] ^ 
                c[25] ^ c[27] ^ c[28] ^ c[29] ^ c[30] ^ c[31];
    newCrc[6] = d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[25] ^ c[26] ^ 
                c[28] ^ c[29] ^ c[30] ^ c[31];
    newCrc[7] = d[7] ^ d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[24] ^ c[26] ^ 
                c[27] ^ c[29] ^ c[31];
    newCrc[8] = d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[0] ^ c[24] ^ c[25] ^ 
                c[27] ^ c[28];
    newCrc[9] = d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[1] ^ c[25] ^ c[26] ^ 
                c[28] ^ c[29];
    newCrc[10] = d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[2] ^ c[24] ^ c[26] ^ 
                 c[27] ^ c[29];
    newCrc[11] = d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[3] ^ c[24] ^ c[25] ^ 
                 c[27] ^ c[28];
    newCrc[12] = d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ d[0] ^ c[4] ^ c[24] ^ 
                 c[25] ^ c[26] ^ c[28] ^ c[29] ^ c[30];
    newCrc[13] = d[7] ^ d[6] ^ d[5] ^ d[3] ^ d[2] ^ d[1] ^ c[5] ^ c[25] ^ 
                 c[26] ^ c[27] ^ c[29] ^ c[30] ^ c[31];
    newCrc[14] = d[7] ^ d[6] ^ d[4] ^ d[3] ^ d[2] ^ c[6] ^ c[26] ^ c[27] ^ 
                 c[28] ^ c[30] ^ c[31];
    newCrc[15] = d[7] ^ d[5] ^ d[4] ^ d[3] ^ c[7] ^ c[27] ^ c[28] ^ 
                 c[29] ^ c[31];
    newCrc[16] = d[5] ^ d[4] ^ d[0] ^ c[8] ^ c[24] ^ c[28] ^ c[29];
    newCrc[17] = d[6] ^ d[5] ^ d[1] ^ c[9] ^ c[25] ^ c[29] ^ c[30];
    newCrc[18] = d[7] ^ d[6] ^ d[2] ^ c[10] ^ c[26] ^ c[30] ^ c[31];
    newCrc[19] = d[7] ^ d[3] ^ c[11] ^ c[27] ^ c[31];
    newCrc[20] = d[4] ^ c[12] ^ c[28];
    newCrc[21] = d[5] ^ c[13] ^ c[29];
    newCrc[22] = d[0] ^ c[14] ^ c[24];
    newCrc[23] = d[6] ^ d[1] ^ d[0] ^ c[15] ^ c[24] ^ c[25] ^ c[30];
    newCrc[24] = d[7] ^ d[2] ^ d[1] ^ c[16] ^ c[25] ^ c[26] ^ c[31];
    newCrc[25] = d[3] ^ d[2] ^ c[17] ^ c[26] ^ c[27];
    newCrc[26] = d[6] ^ d[4] ^ d[3] ^ d[0] ^ c[18] ^ c[24] ^ c[27] ^ 
                 c[28] ^ c[30];
    newCrc[27] = d[7] ^ d[5] ^ d[4] ^ d[1] ^ c[19] ^ c[25] ^ c[28] ^ 
                 c[29] ^ c[31];
    newCrc[28] = d[6] ^ d[5] ^ d[2] ^ c[20] ^ c[26] ^ c[29] ^ c[30];
    newCrc[29] = d[7] ^ d[6] ^ d[3] ^ c[21] ^ c[27] ^ c[30] ^ c[31];
    newCrc[30] = d[7] ^ d[4] ^ c[22] ^ c[28] ^ c[31];
    newCrc[31] = d[5] ^ c[23] ^ c[29];

    return newCrc;
  endfunction

endpackage
