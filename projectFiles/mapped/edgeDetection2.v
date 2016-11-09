/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Apr 27 04:35:14 2016
/////////////////////////////////////////////////////////////


module controller2 ( clk, n_rst, startSignal, readDone, rwError, countVal, 
        countOut, signalToAssertWriteEnable, writeDone, executeRead, 
        readEnable, outputError, grayReady, grayReady2, writeEnable, 
        realOutputEnable );
  input [31:0] startSignal;
  input [31:0] readDone;
  input [31:0] rwError;
  input [3:0] countVal;
  input [3:0] countOut;
  input [31:0] signalToAssertWriteEnable;
  input [31:0] writeDone;
  output [31:0] readEnable;
  output [31:0] outputError;
  output [31:0] realOutputEnable;
  input clk, n_rst;
  output executeRead, grayReady, grayReady2, writeEnable;
  wire   assertWrite, assertWriteTemp, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31;
  wire   [2:0] nxtState;
  wire   [2:0] state;
  assign realOutputEnable[1] = 1'b0;
  assign realOutputEnable[2] = 1'b0;
  assign realOutputEnable[3] = 1'b0;
  assign realOutputEnable[4] = 1'b0;
  assign realOutputEnable[5] = 1'b0;
  assign realOutputEnable[6] = 1'b0;
  assign realOutputEnable[7] = 1'b0;
  assign realOutputEnable[8] = 1'b0;
  assign realOutputEnable[9] = 1'b0;
  assign realOutputEnable[10] = 1'b0;
  assign realOutputEnable[11] = 1'b0;
  assign realOutputEnable[12] = 1'b0;
  assign realOutputEnable[13] = 1'b0;
  assign realOutputEnable[14] = 1'b0;
  assign realOutputEnable[15] = 1'b0;
  assign realOutputEnable[16] = 1'b0;
  assign realOutputEnable[17] = 1'b0;
  assign realOutputEnable[18] = 1'b0;
  assign realOutputEnable[19] = 1'b0;
  assign realOutputEnable[20] = 1'b0;
  assign realOutputEnable[21] = 1'b0;
  assign realOutputEnable[22] = 1'b0;
  assign realOutputEnable[23] = 1'b0;
  assign realOutputEnable[24] = 1'b0;
  assign realOutputEnable[25] = 1'b0;
  assign realOutputEnable[26] = 1'b0;
  assign realOutputEnable[27] = 1'b0;
  assign realOutputEnable[28] = 1'b0;
  assign realOutputEnable[29] = 1'b0;
  assign realOutputEnable[30] = 1'b0;
  assign realOutputEnable[31] = 1'b0;
  assign outputError[1] = 1'b0;
  assign outputError[2] = 1'b0;
  assign outputError[3] = 1'b0;
  assign outputError[4] = 1'b0;
  assign outputError[5] = 1'b0;
  assign outputError[6] = 1'b0;
  assign outputError[7] = 1'b0;
  assign outputError[8] = 1'b0;
  assign outputError[9] = 1'b0;
  assign outputError[10] = 1'b0;
  assign outputError[11] = 1'b0;
  assign outputError[12] = 1'b0;
  assign outputError[13] = 1'b0;
  assign outputError[14] = 1'b0;
  assign outputError[15] = 1'b0;
  assign outputError[16] = 1'b0;
  assign outputError[17] = 1'b0;
  assign outputError[18] = 1'b0;
  assign outputError[19] = 1'b0;
  assign outputError[20] = 1'b0;
  assign outputError[21] = 1'b0;
  assign outputError[22] = 1'b0;
  assign outputError[23] = 1'b0;
  assign outputError[24] = 1'b0;
  assign outputError[25] = 1'b0;
  assign outputError[26] = 1'b0;
  assign outputError[27] = 1'b0;
  assign outputError[28] = 1'b0;
  assign outputError[29] = 1'b0;
  assign outputError[30] = 1'b0;
  assign outputError[31] = 1'b0;
  assign readEnable[1] = 1'b0;
  assign readEnable[2] = 1'b0;
  assign readEnable[3] = 1'b0;
  assign readEnable[4] = 1'b0;
  assign readEnable[5] = 1'b0;
  assign readEnable[6] = 1'b0;
  assign readEnable[7] = 1'b0;
  assign readEnable[8] = 1'b0;
  assign readEnable[9] = 1'b0;
  assign readEnable[10] = 1'b0;
  assign readEnable[11] = 1'b0;
  assign readEnable[12] = 1'b0;
  assign readEnable[13] = 1'b0;
  assign readEnable[14] = 1'b0;
  assign readEnable[15] = 1'b0;
  assign readEnable[16] = 1'b0;
  assign readEnable[17] = 1'b0;
  assign readEnable[18] = 1'b0;
  assign readEnable[19] = 1'b0;
  assign readEnable[20] = 1'b0;
  assign readEnable[21] = 1'b0;
  assign readEnable[22] = 1'b0;
  assign readEnable[23] = 1'b0;
  assign readEnable[24] = 1'b0;
  assign readEnable[25] = 1'b0;
  assign readEnable[26] = 1'b0;
  assign readEnable[27] = 1'b0;
  assign readEnable[28] = 1'b0;
  assign readEnable[29] = 1'b0;
  assign readEnable[30] = 1'b0;
  assign readEnable[31] = 1'b0;
  assign writeEnable = assertWriteTemp;

  DFFSR \state_reg[0]  ( .D(nxtState[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[2]  ( .D(nxtState[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[1]  ( .D(nxtState[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR assertWriteTemp_reg ( .D(assertWrite), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(assertWriteTemp) );
  OR2X1 U7 ( .A(n5), .B(n6), .Y(nxtState[2]) );
  OAI22X1 U8 ( .A(writeDone[0]), .B(n7), .C(n8), .D(n9), .Y(n6) );
  NAND3X1 U9 ( .A(n10), .B(n11), .C(n12), .Y(n5) );
  INVX1 U10 ( .A(assertWrite), .Y(n10) );
  OAI21X1 U11 ( .A(rwError[0]), .B(n8), .C(n13), .Y(nxtState[1]) );
  AND2X1 U12 ( .A(n14), .B(n12), .Y(n13) );
  NAND3X1 U13 ( .A(n15), .B(n16), .C(n17), .Y(nxtState[0]) );
  NOR2X1 U14 ( .A(realOutputEnable[0]), .B(n18), .Y(n17) );
  MUX2X1 U15 ( .B(n12), .A(n19), .S(n20), .Y(n18) );
  NAND3X1 U16 ( .A(n21), .B(n22), .C(startSignal[0]), .Y(n19) );
  NAND3X1 U17 ( .A(n8), .B(n15), .C(state[1]), .Y(n12) );
  INVX1 U18 ( .A(n16), .Y(grayReady) );
  NAND3X1 U19 ( .A(readEnable[0]), .B(n9), .C(readDone[0]), .Y(n16) );
  INVX1 U20 ( .A(rwError[0]), .Y(n9) );
  INVX1 U21 ( .A(n8), .Y(readEnable[0]) );
  NAND3X1 U22 ( .A(n20), .B(n22), .C(state[1]), .Y(n8) );
  INVX1 U23 ( .A(n11), .Y(outputError[0]) );
  NAND3X1 U24 ( .A(n20), .B(n21), .C(state[2]), .Y(n11) );
  INVX1 U25 ( .A(state[0]), .Y(n20) );
  INVX1 U26 ( .A(n7), .Y(realOutputEnable[0]) );
  NAND3X1 U27 ( .A(state[2]), .B(n21), .C(state[0]), .Y(n7) );
  INVX1 U28 ( .A(n14), .Y(executeRead) );
  NAND3X1 U29 ( .A(n21), .B(n22), .C(state[0]), .Y(n14) );
  INVX1 U30 ( .A(state[1]), .Y(n21) );
  NOR2X1 U31 ( .A(n23), .B(n24), .Y(assertWrite) );
  NAND3X1 U32 ( .A(countVal[0]), .B(countOut[0]), .C(n25), .Y(n24) );
  MUX2X1 U33 ( .B(n26), .A(n27), .S(countVal[3]), .Y(n25) );
  NAND3X1 U34 ( .A(n28), .B(n29), .C(countOut[3]), .Y(n27) );
  INVX1 U35 ( .A(countVal[1]), .Y(n29) );
  INVX1 U36 ( .A(countOut[1]), .Y(n28) );
  NAND3X1 U37 ( .A(countOut[1]), .B(n30), .C(countVal[1]), .Y(n26) );
  INVX1 U38 ( .A(countOut[3]), .Y(n30) );
  NAND2X1 U39 ( .A(n31), .B(grayReady2), .Y(n23) );
  INVX1 U40 ( .A(n15), .Y(grayReady2) );
  NAND3X1 U41 ( .A(state[0]), .B(n22), .C(state[1]), .Y(n15) );
  INVX1 U42 ( .A(state[2]), .Y(n22) );
  NOR2X1 U43 ( .A(countVal[2]), .B(countOut[2]), .Y(n31) );
endmodule


module readController ( clk, n_rst, rowCount, colCount, offsetCount, 
        startSobel, executeRead, readAddress, numPixToLoad );
  input [1:0] rowCount;
  input [9:0] colCount;
  input [8:0] offsetCount;
  output [31:0] readAddress;
  output [3:0] numPixToLoad;
  input clk, n_rst, startSobel, executeRead;
  wire   N0, N31, N32, N33, N34, N35, N36, N37, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n26, n28, n30, n32, n34, n36, n38, n40, n42, n44, n46, n48, n50, n52,
         n54, n56, n58, n60, n62, n63, n64, n65, n66, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174;
  wire   [3:0] temp2_numPixToLoad;
  assign readAddress[31] = 1'b0;
  assign readAddress[30] = 1'b0;
  assign readAddress[29] = 1'b0;
  assign readAddress[28] = 1'b0;
  assign readAddress[27] = 1'b0;
  assign readAddress[26] = 1'b0;
  assign readAddress[25] = 1'b0;
  assign readAddress[24] = 1'b0;
  assign readAddress[4] = 1'b0;
  assign readAddress[3] = 1'b0;
  assign readAddress[2] = 1'b0;
  assign readAddress[1] = 1'b0;
  assign readAddress[0] = 1'b0;
  assign numPixToLoad[2] = 1'b0;
  assign numPixToLoad[0] = 1'b1;
  assign N31 = colCount[0];
  assign N32 = colCount[1];
  assign N33 = colCount[2];
  assign N34 = colCount[3];
  assign N35 = colCount[4];
  assign N36 = colCount[5];
  assign N37 = colCount[6];

  DFFSR \temp2_numPixToLoad_reg[3]  ( .D(n174), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(temp2_numPixToLoad[3]) );
  DFFSR \temp2_numPixToLoad_reg[1]  ( .D(N0), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(temp2_numPixToLoad[1]) );
  DFFSR \set_readAddress_reg[23]  ( .D(n155), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[23]) );
  DFFSR \set_readAddress_reg[22]  ( .D(n156), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[22]) );
  DFFSR \set_readAddress_reg[21]  ( .D(n157), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[21]) );
  DFFSR \set_readAddress_reg[20]  ( .D(n158), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[20]) );
  DFFSR \set_readAddress_reg[19]  ( .D(n159), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[19]) );
  DFFSR \set_readAddress_reg[18]  ( .D(n160), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[18]) );
  DFFSR \set_readAddress_reg[17]  ( .D(n161), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[17]) );
  DFFSR \set_readAddress_reg[16]  ( .D(n162), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[16]) );
  DFFSR \set_readAddress_reg[15]  ( .D(n163), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[15]) );
  DFFSR \set_readAddress_reg[14]  ( .D(n164), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[14]) );
  DFFSR \set_readAddress_reg[13]  ( .D(n165), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[13]) );
  DFFSR \set_readAddress_reg[12]  ( .D(n166), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[12]) );
  DFFSR \set_readAddress_reg[11]  ( .D(n168), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[11]) );
  DFFSR \set_readAddress_reg[10]  ( .D(n169), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[10]) );
  DFFSR \set_readAddress_reg[9]  ( .D(n170), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[9]) );
  DFFSR \set_readAddress_reg[8]  ( .D(n171), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[8]) );
  DFFSR \set_readAddress_reg[7]  ( .D(n172), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[7]) );
  DFFSR \set_readAddress_reg[6]  ( .D(n173), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[6]) );
  DFFSR \set_readAddress_reg[5]  ( .D(n167), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(readAddress[5]) );
  DFFSR \set_numPixToLoad_reg[3]  ( .D(temp2_numPixToLoad[3]), .CLK(clk), .R(
        1'b1), .S(n_rst), .Q(numPixToLoad[3]) );
  DFFSR \set_numPixToLoad_reg[1]  ( .D(temp2_numPixToLoad[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(numPixToLoad[1]) );
  INVX2 U3 ( .A(executeRead), .Y(n1) );
  MUX2X1 U6 ( .B(n2), .A(n3), .S(n1), .Y(n155) );
  INVX1 U7 ( .A(readAddress[23]), .Y(n3) );
  AOI21X1 U8 ( .A(n4), .B(n5), .C(n6), .Y(n2) );
  OAI21X1 U9 ( .A(n7), .B(n8), .C(n9), .Y(n6) );
  NAND2X1 U10 ( .A(n10), .B(n11), .Y(n8) );
  INVX1 U11 ( .A(n12), .Y(n10) );
  MUX2X1 U12 ( .B(n13), .A(n14), .S(n1), .Y(n156) );
  INVX1 U13 ( .A(readAddress[22]), .Y(n14) );
  XOR2X1 U14 ( .A(n15), .B(n11), .Y(n13) );
  XNOR2X1 U15 ( .A(n4), .B(n16), .Y(n11) );
  AND2X1 U16 ( .A(n17), .B(n18), .Y(n4) );
  OR2X1 U17 ( .A(n7), .B(n12), .Y(n15) );
  MUX2X1 U18 ( .B(n19), .A(n20), .S(n1), .Y(n157) );
  INVX1 U19 ( .A(readAddress[21]), .Y(n20) );
  XNOR2X1 U20 ( .A(n7), .B(n12), .Y(n19) );
  XOR2X1 U21 ( .A(n17), .B(n21), .Y(n12) );
  NOR2X1 U22 ( .A(n22), .B(n18), .Y(n21) );
  OAI21X1 U23 ( .A(n26), .B(n16), .C(n28), .Y(n18) );
  OAI21X1 U24 ( .A(n5), .B(n30), .C(n32), .Y(n28) );
  INVX1 U25 ( .A(n5), .Y(n16) );
  INVX1 U26 ( .A(n9), .Y(n22) );
  NAND2X1 U27 ( .A(n34), .B(offsetCount[8]), .Y(n9) );
  NAND3X1 U28 ( .A(n36), .B(n38), .C(n40), .Y(n7) );
  MUX2X1 U29 ( .B(n42), .A(n44), .S(n1), .Y(n158) );
  INVX1 U30 ( .A(readAddress[20]), .Y(n44) );
  XOR2X1 U31 ( .A(n46), .B(n38), .Y(n42) );
  XOR2X1 U32 ( .A(n48), .B(n32), .Y(n38) );
  XNOR2X1 U33 ( .A(n26), .B(n5), .Y(n48) );
  XOR2X1 U34 ( .A(n34), .B(offsetCount[8]), .Y(n5) );
  INVX1 U35 ( .A(n50), .Y(n34) );
  NAND3X1 U36 ( .A(n52), .B(offsetCount[6]), .C(offsetCount[7]), .Y(n50) );
  INVX1 U37 ( .A(n30), .Y(n26) );
  OAI21X1 U38 ( .A(n54), .B(n56), .C(n58), .Y(n30) );
  OAI21X1 U39 ( .A(n17), .B(n60), .C(n62), .Y(n58) );
  INVX1 U40 ( .A(n54), .Y(n60) );
  INVX1 U41 ( .A(n17), .Y(n56) );
  NAND2X1 U42 ( .A(n40), .B(n36), .Y(n46) );
  MUX2X1 U43 ( .B(n63), .A(n64), .S(n1), .Y(n159) );
  INVX1 U44 ( .A(readAddress[19]), .Y(n64) );
  XNOR2X1 U45 ( .A(n40), .B(n36), .Y(n63) );
  XNOR2X1 U46 ( .A(n65), .B(n66), .Y(n36) );
  XNOR2X1 U75 ( .A(n54), .B(n17), .Y(n65) );
  XOR2X1 U76 ( .A(offsetCount[7]), .B(n69), .Y(n17) );
  AND2X1 U85 ( .A(offsetCount[6]), .B(n52), .Y(n69) );
  AOI21X1 U86 ( .A(n70), .B(n32), .C(n71), .Y(n54) );
  INVX1 U87 ( .A(n72), .Y(n71) );
  OAI21X1 U88 ( .A(n32), .B(n70), .C(n73), .Y(n72) );
  INVX1 U89 ( .A(n74), .Y(n40) );
  NAND3X1 U90 ( .A(n75), .B(n76), .C(n77), .Y(n74) );
  MUX2X1 U91 ( .B(n78), .A(n79), .S(n1), .Y(n160) );
  INVX1 U92 ( .A(readAddress[18]), .Y(n79) );
  XOR2X1 U93 ( .A(n80), .B(n76), .Y(n78) );
  XOR2X1 U94 ( .A(n81), .B(n73), .Y(n76) );
  XOR2X1 U95 ( .A(n70), .B(n32), .Y(n81) );
  XOR2X1 U96 ( .A(n52), .B(offsetCount[6]), .Y(n32) );
  INVX1 U97 ( .A(n82), .Y(n52) );
  NAND3X1 U98 ( .A(n83), .B(offsetCount[4]), .C(offsetCount[5]), .Y(n82) );
  OAI21X1 U99 ( .A(n84), .B(n66), .C(n85), .Y(n70) );
  OAI21X1 U100 ( .A(n62), .B(n86), .C(n87), .Y(n85) );
  INVX1 U101 ( .A(n84), .Y(n86) );
  INVX1 U102 ( .A(n62), .Y(n66) );
  NAND2X1 U103 ( .A(n77), .B(n75), .Y(n80) );
  MUX2X1 U104 ( .B(n88), .A(n89), .S(n1), .Y(n161) );
  INVX1 U105 ( .A(readAddress[17]), .Y(n89) );
  XNOR2X1 U106 ( .A(n77), .B(n75), .Y(n88) );
  XNOR2X1 U107 ( .A(n90), .B(n91), .Y(n75) );
  XNOR2X1 U108 ( .A(n84), .B(n62), .Y(n90) );
  XOR2X1 U109 ( .A(offsetCount[5]), .B(n92), .Y(n62) );
  NOR2X1 U110 ( .A(n93), .B(n94), .Y(n92) );
  AOI21X1 U111 ( .A(n95), .B(n73), .C(n96), .Y(n84) );
  INVX1 U112 ( .A(n97), .Y(n96) );
  OAI21X1 U113 ( .A(n73), .B(n95), .C(n98), .Y(n97) );
  INVX1 U114 ( .A(n99), .Y(n77) );
  NAND3X1 U115 ( .A(n100), .B(n101), .C(n102), .Y(n99) );
  MUX2X1 U116 ( .B(n103), .A(n104), .S(n1), .Y(n162) );
  INVX1 U117 ( .A(readAddress[16]), .Y(n104) );
  XNOR2X1 U118 ( .A(n100), .B(n105), .Y(n103) );
  AND2X1 U119 ( .A(n101), .B(n102), .Y(n105) );
  XOR2X1 U120 ( .A(n106), .B(n98), .Y(n100) );
  XOR2X1 U121 ( .A(n95), .B(n73), .Y(n106) );
  XNOR2X1 U122 ( .A(n83), .B(n93), .Y(n73) );
  INVX1 U123 ( .A(offsetCount[4]), .Y(n93) );
  INVX1 U124 ( .A(n94), .Y(n83) );
  NAND3X1 U125 ( .A(offsetCount[2]), .B(n107), .C(offsetCount[3]), .Y(n94) );
  OAI21X1 U126 ( .A(n91), .B(n108), .C(n109), .Y(n95) );
  OAI21X1 U127 ( .A(n110), .B(n87), .C(n111), .Y(n109) );
  INVX1 U128 ( .A(n87), .Y(n91) );
  MUX2X1 U129 ( .B(n112), .A(n113), .S(n1), .Y(n163) );
  INVX1 U130 ( .A(readAddress[15]), .Y(n113) );
  XNOR2X1 U131 ( .A(n101), .B(n102), .Y(n112) );
  XOR2X1 U132 ( .A(n114), .B(n115), .Y(n102) );
  XNOR2X1 U133 ( .A(n110), .B(n87), .Y(n114) );
  XOR2X1 U134 ( .A(offsetCount[3]), .B(n116), .Y(n87) );
  AND2X1 U135 ( .A(n107), .B(offsetCount[2]), .Y(n116) );
  INVX1 U136 ( .A(n108), .Y(n110) );
  NAND2X1 U137 ( .A(n98), .B(n117), .Y(n108) );
  INVX1 U138 ( .A(n118), .Y(n98) );
  OAI21X1 U139 ( .A(n119), .B(n120), .C(n121), .Y(n101) );
  OAI21X1 U140 ( .A(n122), .B(n123), .C(colCount[9]), .Y(n121) );
  INVX1 U141 ( .A(n120), .Y(n122) );
  MUX2X1 U142 ( .B(n124), .A(n125), .S(n1), .Y(n164) );
  INVX1 U143 ( .A(readAddress[14]), .Y(n125) );
  XNOR2X1 U144 ( .A(n120), .B(n126), .Y(n124) );
  XNOR2X1 U145 ( .A(n127), .B(n119), .Y(n126) );
  INVX1 U146 ( .A(n123), .Y(n119) );
  OAI21X1 U147 ( .A(n115), .B(n128), .C(n129), .Y(n123) );
  OAI21X1 U148 ( .A(n130), .B(n111), .C(colCount[8]), .Y(n129) );
  XOR2X1 U149 ( .A(n118), .B(n117), .Y(n120) );
  XNOR2X1 U150 ( .A(offsetCount[2]), .B(n107), .Y(n118) );
  OAI21X1 U151 ( .A(n131), .B(n132), .C(n133), .Y(n107) );
  OAI21X1 U152 ( .A(n134), .B(offsetCount[1]), .C(rowCount[1]), .Y(n133) );
  MUX2X1 U153 ( .B(n135), .A(n136), .S(n1), .Y(n165) );
  INVX1 U154 ( .A(readAddress[13]), .Y(n136) );
  XNOR2X1 U155 ( .A(n137), .B(n115), .Y(n135) );
  INVX1 U156 ( .A(n111), .Y(n115) );
  XOR2X1 U157 ( .A(n134), .B(n138), .Y(n111) );
  XNOR2X1 U158 ( .A(rowCount[1]), .B(n131), .Y(n138) );
  INVX1 U159 ( .A(offsetCount[1]), .Y(n131) );
  INVX1 U160 ( .A(n132), .Y(n134) );
  NAND2X1 U161 ( .A(offsetCount[0]), .B(rowCount[0]), .Y(n132) );
  XNOR2X1 U162 ( .A(n130), .B(colCount[8]), .Y(n137) );
  INVX1 U163 ( .A(n128), .Y(n130) );
  NAND2X1 U164 ( .A(colCount[7]), .B(n117), .Y(n128) );
  MUX2X1 U165 ( .B(n139), .A(n140), .S(n1), .Y(n166) );
  INVX1 U166 ( .A(readAddress[12]), .Y(n140) );
  XNOR2X1 U167 ( .A(colCount[7]), .B(n117), .Y(n139) );
  XOR2X1 U168 ( .A(offsetCount[0]), .B(rowCount[0]), .Y(n117) );
  INVX1 U169 ( .A(n141), .Y(n167) );
  MUX2X1 U170 ( .B(N31), .A(readAddress[5]), .S(n1), .Y(n141) );
  INVX1 U171 ( .A(n142), .Y(n168) );
  MUX2X1 U172 ( .B(N37), .A(readAddress[11]), .S(n1), .Y(n142) );
  INVX1 U173 ( .A(n143), .Y(n169) );
  MUX2X1 U174 ( .B(N36), .A(readAddress[10]), .S(n1), .Y(n143) );
  INVX1 U175 ( .A(n144), .Y(n170) );
  MUX2X1 U176 ( .B(N35), .A(readAddress[9]), .S(n1), .Y(n144) );
  INVX1 U177 ( .A(n145), .Y(n171) );
  MUX2X1 U178 ( .B(N34), .A(readAddress[8]), .S(n1), .Y(n145) );
  INVX1 U179 ( .A(n146), .Y(n172) );
  MUX2X1 U180 ( .B(N33), .A(readAddress[7]), .S(n1), .Y(n146) );
  INVX1 U181 ( .A(n147), .Y(n173) );
  MUX2X1 U182 ( .B(N32), .A(readAddress[6]), .S(n1), .Y(n147) );
  INVX1 U183 ( .A(N0), .Y(n174) );
  NAND3X1 U184 ( .A(n148), .B(n149), .C(n150), .Y(N0) );
  NOR2X1 U185 ( .A(n151), .B(n152), .Y(n150) );
  OR2X1 U186 ( .A(N36), .B(N37), .Y(n152) );
  NAND3X1 U187 ( .A(n153), .B(n127), .C(n154), .Y(n151) );
  INVX1 U188 ( .A(colCount[7]), .Y(n154) );
  INVX1 U189 ( .A(colCount[9]), .Y(n127) );
  INVX1 U190 ( .A(colCount[8]), .Y(n153) );
  NOR2X1 U191 ( .A(N35), .B(N34), .Y(n149) );
  AOI21X1 U192 ( .A(N32), .B(N31), .C(N33), .Y(n148) );
endmodule


module flex_counter2_NUM_CNT_BITS2 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [1:0] rollover_val;
  output [1:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n29, n30, n31, n1, n2, n3, n4, n5, n6, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20;

  DFFSR \count_out_reg[0]  ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n29), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  MUX2X1 U6 ( .B(n1), .A(n2), .S(count_out[0]), .Y(n31) );
  OAI22X1 U7 ( .A(n3), .B(n1), .C(n2), .D(n4), .Y(n30) );
  INVX1 U8 ( .A(count_out[1]), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(n2) );
  NAND3X1 U10 ( .A(n6), .B(n10), .C(count_enable), .Y(n1) );
  INVX1 U11 ( .A(n11), .Y(n6) );
  OAI21X1 U12 ( .A(n12), .B(n13), .C(n14), .Y(n29) );
  NAND2X1 U13 ( .A(rollover_flag), .B(n5), .Y(n14) );
  NOR2X1 U14 ( .A(clear), .B(count_enable), .Y(n5) );
  NAND2X1 U15 ( .A(count_enable), .B(n15), .Y(n13) );
  OAI21X1 U16 ( .A(n3), .B(n11), .C(rollover_val[1]), .Y(n15) );
  NAND2X1 U17 ( .A(n16), .B(n10), .Y(n12) );
  INVX1 U18 ( .A(clear), .Y(n10) );
  OAI21X1 U19 ( .A(count_out[0]), .B(n11), .C(rollover_val[0]), .Y(n16) );
  OAI21X1 U20 ( .A(rollover_val[1]), .B(n3), .C(n17), .Y(n11) );
  OAI21X1 U21 ( .A(n18), .B(n19), .C(n20), .Y(n17) );
  NOR2X1 U22 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n20) );
  INVX1 U23 ( .A(rollover_val[1]), .Y(n19) );
  INVX1 U24 ( .A(n18), .Y(n3) );
  XOR2X1 U25 ( .A(count_out[1]), .B(count_out[0]), .Y(n18) );
endmodule


module flex_counter2_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter2_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n1, n2, n3, n4, n5, n6, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94;

  DFFSR \count_out_reg[0]  ( .D(n63), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n62), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n61), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n58), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR rollover_flag_reg ( .D(n94), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter2_NUM_CNT_BITS10_DW01_inc_0 add_42 ( .A(count_out), .SUM({N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4}) );
  MUX2X1 U5 ( .B(n1), .A(n2), .S(n3), .Y(n94) );
  INVX1 U6 ( .A(rollover_flag), .Y(n2) );
  NAND3X1 U16 ( .A(n4), .B(n5), .C(n6), .Y(n1) );
  NOR2X1 U17 ( .A(n18), .B(n19), .Y(n6) );
  NAND3X1 U18 ( .A(n20), .B(n21), .C(n22), .Y(n19) );
  OAI21X1 U19 ( .A(n23), .B(n24), .C(n25), .Y(n22) );
  NAND2X1 U20 ( .A(n26), .B(n27), .Y(n24) );
  NAND3X1 U21 ( .A(n28), .B(n29), .C(n30), .Y(n23) );
  INVX1 U22 ( .A(rollover_val[9]), .Y(n29) );
  NAND3X1 U23 ( .A(n31), .B(n32), .C(n33), .Y(n18) );
  AND2X1 U24 ( .A(n34), .B(n35), .Y(n33) );
  AOI21X1 U25 ( .A(rollover_val[4]), .B(n36), .C(n37), .Y(n5) );
  OAI22X1 U26 ( .A(N7), .B(n28), .C(N4), .D(n26), .Y(n37) );
  INVX1 U27 ( .A(rollover_val[0]), .Y(n26) );
  INVX1 U28 ( .A(rollover_val[3]), .Y(n28) );
  AOI21X1 U29 ( .A(rollover_val[2]), .B(n38), .C(n39), .Y(n4) );
  OAI21X1 U30 ( .A(N5), .B(n27), .C(n40), .Y(n39) );
  OAI21X1 U31 ( .A(n41), .B(n42), .C(n25), .Y(n40) );
  OR2X1 U32 ( .A(rollover_val[4]), .B(rollover_val[5]), .Y(n42) );
  INVX1 U33 ( .A(n43), .Y(n41) );
  NOR3X1 U34 ( .A(rollover_val[7]), .B(rollover_val[8]), .C(rollover_val[6]), 
        .Y(n43) );
  OAI21X1 U35 ( .A(n44), .B(n45), .C(n46), .Y(n63) );
  NAND2X1 U36 ( .A(count_out[0]), .B(n3), .Y(n46) );
  OAI21X1 U37 ( .A(n47), .B(n45), .C(n48), .Y(n62) );
  NAND2X1 U38 ( .A(count_out[1]), .B(n3), .Y(n48) );
  OAI21X1 U39 ( .A(n38), .B(n45), .C(n49), .Y(n61) );
  NAND2X1 U40 ( .A(count_out[2]), .B(n3), .Y(n49) );
  OAI21X1 U41 ( .A(n50), .B(n45), .C(n51), .Y(n60) );
  NAND2X1 U42 ( .A(count_out[3]), .B(n3), .Y(n51) );
  OAI21X1 U43 ( .A(n36), .B(n45), .C(n52), .Y(n59) );
  NAND2X1 U44 ( .A(count_out[4]), .B(n3), .Y(n52) );
  OAI21X1 U45 ( .A(n53), .B(n45), .C(n64), .Y(n58) );
  NAND2X1 U46 ( .A(count_out[5]), .B(n3), .Y(n64) );
  OAI21X1 U47 ( .A(n65), .B(n45), .C(n66), .Y(n57) );
  NAND2X1 U48 ( .A(count_out[6]), .B(n3), .Y(n66) );
  OAI21X1 U49 ( .A(n67), .B(n45), .C(n68), .Y(n56) );
  NAND2X1 U50 ( .A(count_out[7]), .B(n3), .Y(n68) );
  OAI21X1 U51 ( .A(n69), .B(n45), .C(n70), .Y(n55) );
  NAND2X1 U52 ( .A(count_out[8]), .B(n3), .Y(n70) );
  OAI21X1 U53 ( .A(n71), .B(n45), .C(n72), .Y(n54) );
  NAND2X1 U54 ( .A(count_out[9]), .B(n3), .Y(n72) );
  NAND3X1 U55 ( .A(n73), .B(n34), .C(n74), .Y(n45) );
  INVX1 U56 ( .A(n25), .Y(n74) );
  OAI21X1 U57 ( .A(rollover_val[9]), .B(n71), .C(n75), .Y(n25) );
  NAND2X1 U58 ( .A(n76), .B(n35), .Y(n75) );
  NAND2X1 U59 ( .A(rollover_val[9]), .B(n71), .Y(n35) );
  OAI22X1 U60 ( .A(rollover_val[8]), .B(n69), .C(n77), .D(n78), .Y(n76) );
  OAI21X1 U61 ( .A(n79), .B(n80), .C(n21), .Y(n78) );
  NAND2X1 U62 ( .A(rollover_val[8]), .B(n69), .Y(n21) );
  OAI22X1 U63 ( .A(rollover_val[6]), .B(n65), .C(n81), .D(n82), .Y(n80) );
  OAI21X1 U64 ( .A(n83), .B(n84), .C(n32), .Y(n82) );
  NAND2X1 U65 ( .A(rollover_val[6]), .B(n65), .Y(n32) );
  OAI21X1 U66 ( .A(n85), .B(n36), .C(n86), .Y(n84) );
  INVX1 U67 ( .A(n87), .Y(n86) );
  AOI21X1 U68 ( .A(n85), .B(n36), .C(rollover_val[4]), .Y(n87) );
  INVX1 U69 ( .A(N8), .Y(n36) );
  OAI21X1 U70 ( .A(N7), .B(n88), .C(n89), .Y(n85) );
  OAI21X1 U71 ( .A(n90), .B(n50), .C(rollover_val[3]), .Y(n89) );
  INVX1 U72 ( .A(N7), .Y(n50) );
  INVX1 U73 ( .A(n90), .Y(n88) );
  OAI21X1 U74 ( .A(N6), .B(n30), .C(n91), .Y(n90) );
  OAI21X1 U75 ( .A(rollover_val[2]), .B(n38), .C(n92), .Y(n91) );
  OAI21X1 U76 ( .A(N5), .B(n27), .C(n93), .Y(n92) );
  OAI22X1 U77 ( .A(rollover_val[1]), .B(n47), .C(rollover_val[0]), .D(n44), 
        .Y(n93) );
  INVX1 U78 ( .A(N4), .Y(n44) );
  INVX1 U79 ( .A(N5), .Y(n47) );
  INVX1 U80 ( .A(rollover_val[1]), .Y(n27) );
  INVX1 U81 ( .A(N6), .Y(n38) );
  INVX1 U82 ( .A(rollover_val[2]), .Y(n30) );
  NOR2X1 U83 ( .A(rollover_val[5]), .B(n53), .Y(n83) );
  INVX1 U84 ( .A(n31), .Y(n81) );
  NAND2X1 U85 ( .A(rollover_val[5]), .B(n53), .Y(n31) );
  INVX1 U86 ( .A(N9), .Y(n53) );
  INVX1 U87 ( .A(N10), .Y(n65) );
  NOR2X1 U88 ( .A(rollover_val[7]), .B(n67), .Y(n79) );
  INVX1 U89 ( .A(n20), .Y(n77) );
  NAND2X1 U90 ( .A(rollover_val[7]), .B(n67), .Y(n20) );
  INVX1 U91 ( .A(N11), .Y(n67) );
  INVX1 U92 ( .A(N12), .Y(n69) );
  INVX1 U93 ( .A(clear), .Y(n34) );
  INVX1 U94 ( .A(n3), .Y(n73) );
  NOR2X1 U95 ( .A(count_enable), .B(clear), .Y(n3) );
  INVX1 U96 ( .A(N13), .Y(n71) );
endmodule


module flex_counter2_NUM_CNT_BITS9_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
endmodule


module flex_counter2_NUM_CNT_BITS9 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [8:0] rollover_val;
  output [8:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n1, n2, n3, n4, n5, n6, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82;

  DFFSR \count_out_reg[0]  ( .D(n58), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR rollover_flag_reg ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter2_NUM_CNT_BITS9_DW01_inc_0 add_42 ( .A(count_out), .SUM({N12, 
        N11, N10, N9, N8, N7, N6, N5, N4}) );
  MUX2X1 U5 ( .B(n1), .A(n2), .S(n3), .Y(n82) );
  NAND3X1 U6 ( .A(n4), .B(n5), .C(n6), .Y(n2) );
  NOR2X1 U15 ( .A(n17), .B(n18), .Y(n6) );
  OAI21X1 U16 ( .A(N4), .B(n19), .C(n20), .Y(n18) );
  NAND3X1 U17 ( .A(n21), .B(n22), .C(n23), .Y(n17) );
  OAI21X1 U18 ( .A(n24), .B(n25), .C(n26), .Y(n23) );
  NAND3X1 U19 ( .A(n19), .B(n27), .C(n28), .Y(n25) );
  NOR2X1 U20 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n28) );
  INVX1 U21 ( .A(rollover_val[0]), .Y(n19) );
  NAND3X1 U22 ( .A(n29), .B(n30), .C(n31), .Y(n24) );
  NOR2X1 U23 ( .A(rollover_val[5]), .B(rollover_val[4]), .Y(n31) );
  INVX1 U24 ( .A(rollover_val[6]), .Y(n30) );
  NOR2X1 U25 ( .A(rollover_val[8]), .B(rollover_val[7]), .Y(n29) );
  NOR2X1 U26 ( .A(n32), .B(n33), .Y(n5) );
  NAND2X1 U27 ( .A(n34), .B(n35), .Y(n33) );
  NOR2X1 U28 ( .A(n36), .B(n37), .Y(n4) );
  INVX1 U29 ( .A(n38), .Y(n36) );
  INVX1 U30 ( .A(rollover_flag), .Y(n1) );
  OAI21X1 U31 ( .A(n39), .B(n40), .C(n41), .Y(n58) );
  NAND2X1 U32 ( .A(count_out[0]), .B(n42), .Y(n41) );
  OAI21X1 U33 ( .A(n43), .B(n40), .C(n44), .Y(n57) );
  NAND2X1 U34 ( .A(count_out[1]), .B(n42), .Y(n44) );
  OAI21X1 U35 ( .A(n45), .B(n40), .C(n46), .Y(n56) );
  NAND2X1 U36 ( .A(count_out[2]), .B(n42), .Y(n46) );
  OAI21X1 U37 ( .A(n47), .B(n40), .C(n48), .Y(n55) );
  NAND2X1 U38 ( .A(count_out[3]), .B(n42), .Y(n48) );
  OAI21X1 U39 ( .A(n49), .B(n40), .C(n59), .Y(n54) );
  NAND2X1 U40 ( .A(count_out[4]), .B(n42), .Y(n59) );
  OAI21X1 U41 ( .A(n60), .B(n40), .C(n61), .Y(n53) );
  NAND2X1 U42 ( .A(count_out[5]), .B(n42), .Y(n61) );
  OAI21X1 U43 ( .A(n62), .B(n40), .C(n63), .Y(n52) );
  NAND2X1 U44 ( .A(count_out[6]), .B(n42), .Y(n63) );
  OAI21X1 U45 ( .A(n64), .B(n40), .C(n65), .Y(n51) );
  NAND2X1 U46 ( .A(count_out[7]), .B(n42), .Y(n65) );
  OAI21X1 U47 ( .A(n66), .B(n40), .C(n67), .Y(n50) );
  NAND2X1 U48 ( .A(count_out[8]), .B(n42), .Y(n67) );
  NAND3X1 U49 ( .A(n3), .B(n35), .C(n68), .Y(n40) );
  INVX1 U50 ( .A(n26), .Y(n68) );
  OAI21X1 U51 ( .A(rollover_val[8]), .B(n66), .C(n69), .Y(n26) );
  OAI21X1 U52 ( .A(n70), .B(n71), .C(n20), .Y(n69) );
  AOI22X1 U53 ( .A(n66), .B(rollover_val[8]), .C(n64), .D(rollover_val[7]), 
        .Y(n20) );
  OAI22X1 U54 ( .A(rollover_val[6]), .B(n62), .C(n72), .D(n73), .Y(n71) );
  OAI21X1 U55 ( .A(n74), .B(n75), .C(n22), .Y(n73) );
  NAND2X1 U56 ( .A(rollover_val[6]), .B(n62), .Y(n22) );
  OAI22X1 U57 ( .A(rollover_val[4]), .B(n49), .C(n37), .D(n76), .Y(n75) );
  OAI21X1 U58 ( .A(n77), .B(n78), .C(n38), .Y(n76) );
  NAND2X1 U59 ( .A(rollover_val[4]), .B(n49), .Y(n38) );
  OAI21X1 U60 ( .A(rollover_val[2]), .B(n45), .C(n79), .Y(n78) );
  NAND3X1 U61 ( .A(n34), .B(n80), .C(n81), .Y(n79) );
  INVX1 U62 ( .A(n32), .Y(n81) );
  NOR2X1 U63 ( .A(n27), .B(N5), .Y(n32) );
  INVX1 U64 ( .A(rollover_val[1]), .Y(n27) );
  OAI22X1 U65 ( .A(rollover_val[1]), .B(n43), .C(rollover_val[0]), .D(n39), 
        .Y(n80) );
  INVX1 U66 ( .A(N4), .Y(n39) );
  INVX1 U67 ( .A(N5), .Y(n43) );
  NAND2X1 U68 ( .A(rollover_val[2]), .B(n45), .Y(n34) );
  INVX1 U69 ( .A(N6), .Y(n45) );
  NOR2X1 U70 ( .A(rollover_val[3]), .B(n47), .Y(n77) );
  AND2X1 U71 ( .A(rollover_val[3]), .B(n47), .Y(n37) );
  INVX1 U72 ( .A(N7), .Y(n47) );
  INVX1 U73 ( .A(N8), .Y(n49) );
  NOR2X1 U74 ( .A(rollover_val[5]), .B(n60), .Y(n74) );
  INVX1 U75 ( .A(n21), .Y(n72) );
  NAND2X1 U76 ( .A(rollover_val[5]), .B(n60), .Y(n21) );
  INVX1 U77 ( .A(N9), .Y(n60) );
  INVX1 U78 ( .A(N10), .Y(n62) );
  NOR2X1 U79 ( .A(rollover_val[7]), .B(n64), .Y(n70) );
  INVX1 U80 ( .A(N11), .Y(n64) );
  INVX1 U81 ( .A(clear), .Y(n35) );
  INVX1 U82 ( .A(n42), .Y(n3) );
  NOR2X1 U83 ( .A(count_enable), .B(clear), .Y(n42) );
  INVX1 U84 ( .A(N12), .Y(n66) );
endmodule


module readCounters ( clk, n_rst, executeRead, rowCount, colCount, offsetCount, 
        cols_rollover_flag );
  output [1:0] rowCount;
  output [9:0] colCount;
  output [8:0] offsetCount;
  input clk, n_rst, executeRead;
  output cols_rollover_flag;
  wire   rows_rollover_flag, cols_rollover_flag_Temp, offset_rollover_flag,
         cols_rollover_flag_Temp2;

  DFFSR cols_rollover_flag_Temp2_reg ( .D(cols_rollover_flag_Temp), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(cols_rollover_flag_Temp2) );
  DFFSR cols_rollover_flag_Temp3_reg ( .D(cols_rollover_flag_Temp2), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(cols_rollover_flag) );
  flex_counter2_NUM_CNT_BITS2 ROWS ( .clk(clk), .n_rst(n_rst), .clear(
        rows_rollover_flag), .count_enable(executeRead), .rollover_val({1'b1, 
        1'b1}), .count_out(rowCount), .rollover_flag(rows_rollover_flag) );
  flex_counter2_NUM_CNT_BITS10 COLS ( .clk(clk), .n_rst(n_rst), .clear(
        cols_rollover_flag_Temp), .count_enable(rows_rollover_flag), 
        .rollover_val({1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .count_out(colCount), .rollover_flag(cols_rollover_flag_Temp)
         );
  flex_counter2_NUM_CNT_BITS9 OFFSET ( .clk(clk), .n_rst(n_rst), .clear(
        offset_rollover_flag), .count_enable(cols_rollover_flag_Temp), 
        .rollover_val({1'b1, 1'b1, 1'b1, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0}), 
        .count_out(offsetCount), .rollover_flag(offset_rollover_flag) );
endmodule


module rgbToGray2_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24;
  wire   [15:1] carry;

  FAX1 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .YC(carry[12]), .YS(
        SUM[11]) );
  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YC(carry[11]), .YS(
        SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  AND2X2 U1 ( .A(carry[13]), .B(B[13]), .Y(n1) );
  AND2X2 U2 ( .A(n1), .B(B[14]), .Y(n2) );
  XOR2X1 U3 ( .A(B[15]), .B(n2), .Y(SUM[15]) );
  XOR2X1 U4 ( .A(n1), .B(B[14]), .Y(SUM[14]) );
  XOR2X1 U5 ( .A(carry[13]), .B(B[13]), .Y(SUM[13]) );
  INVX2 U6 ( .A(n14), .Y(n3) );
  INVX2 U7 ( .A(n15), .Y(n4) );
  INVX2 U8 ( .A(n18), .Y(n5) );
  INVX2 U9 ( .A(n19), .Y(n6) );
  INVX2 U10 ( .A(n22), .Y(n7) );
  INVX2 U11 ( .A(n23), .Y(n8) );
  INVX2 U12 ( .A(A[7]), .Y(n9) );
  INVX2 U13 ( .A(A[6]), .Y(n10) );
  INVX2 U14 ( .A(A[4]), .Y(n11) );
  INVX2 U15 ( .A(A[2]), .Y(n12) );
  NAND2X1 U16 ( .A(A[1]), .B(B[1]), .Y(n23) );
  OAI21X1 U17 ( .A(n3), .B(n9), .C(n13), .Y(carry[8]) );
  OAI21X1 U18 ( .A(A[7]), .B(n14), .C(B[7]), .Y(n13) );
  OAI21X1 U19 ( .A(n15), .B(n10), .C(n16), .Y(n14) );
  OAI21X1 U20 ( .A(A[6]), .B(n4), .C(B[6]), .Y(n16) );
  AOI21X1 U21 ( .A(n17), .B(A[5]), .C(n5), .Y(n15) );
  OAI21X1 U22 ( .A(A[5]), .B(n17), .C(B[5]), .Y(n18) );
  OAI21X1 U23 ( .A(n19), .B(n11), .C(n20), .Y(n17) );
  OAI21X1 U24 ( .A(A[4]), .B(n6), .C(B[4]), .Y(n20) );
  AOI21X1 U25 ( .A(n21), .B(A[3]), .C(n7), .Y(n19) );
  OAI21X1 U26 ( .A(A[3]), .B(n21), .C(B[3]), .Y(n22) );
  OAI21X1 U27 ( .A(n23), .B(n12), .C(n24), .Y(n21) );
  OAI21X1 U28 ( .A(A[2]), .B(n8), .C(B[2]), .Y(n24) );
endmodule


module rgbToGray2_DW01_add_1 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [15:1] carry;
  assign SUM[2] = A[2];
  assign SUM[1] = A[1];

  FAX1 U1_13 ( .A(A[13]), .B(B[13]), .C(carry[13]), .YC(carry[14]), .YS(
        SUM[13]) );
  FAX1 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .YC(carry[12]), .YS(
        SUM[11]) );
  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YC(carry[11]), .YS(
        SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(n1), .YC(carry[5]), .YS(SUM[4]) );
  AND2X2 U1 ( .A(B[3]), .B(A[3]), .Y(n1) );
  AND2X2 U2 ( .A(carry[14]), .B(B[14]), .Y(n2) );
  XOR2X1 U3 ( .A(B[15]), .B(n2), .Y(SUM[15]) );
  XOR2X1 U4 ( .A(carry[14]), .B(B[14]), .Y(SUM[14]) );
  XOR2X1 U5 ( .A(B[3]), .B(A[3]), .Y(SUM[3]) );
endmodule


module rgbToGray2_DW_mult_uns_3 ( a, b, product );
  input [5:0] a;
  input [7:0] b;
  output [13:0] product;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, \b[0] ;
  assign product[1] = \b[0] ;
  assign \b[0]  = b[0];

  XNOR2X1 U1 ( .A(n1), .B(b[7]), .Y(product[13]) );
  XNOR2X1 U2 ( .A(n2), .B(b[6]), .Y(product[12]) );
  OR2X2 U3 ( .A(n2), .B(b[6]), .Y(n1) );
  FAX1 U4 ( .A(b[5]), .B(n13), .C(n3), .YC(n2), .YS(product[11]) );
  FAX1 U5 ( .A(n15), .B(n14), .C(n4), .YC(n3), .YS(product[10]) );
  FAX1 U6 ( .A(n16), .B(n17), .C(n5), .YC(n4), .YS(product[9]) );
  FAX1 U7 ( .A(n19), .B(n18), .C(n6), .YC(n5), .YS(product[8]) );
  FAX1 U8 ( .A(n21), .B(n20), .C(n7), .YC(n6), .YS(product[7]) );
  FAX1 U9 ( .A(n23), .B(n22), .C(n8), .YC(n7), .YS(product[6]) );
  FAX1 U10 ( .A(n25), .B(n24), .C(n9), .YC(n8), .YS(product[5]) );
  FAX1 U11 ( .A(n32), .B(n26), .C(n10), .YC(n9), .YS(product[4]) );
  FAX1 U12 ( .A(b[2]), .B(n12), .C(n11), .YC(n10), .YS(product[3]) );
  HAX1 U13 ( .A(n33), .B(n12), .YC(n11), .YS(product[2]) );
  XNOR2X1 U15 ( .A(b[4]), .B(n27), .Y(n14) );
  OR2X2 U16 ( .A(b[4]), .B(n27), .Y(n13) );
  XNOR2X1 U17 ( .A(b[3]), .B(n28), .Y(n16) );
  OR2X2 U18 ( .A(b[3]), .B(n28), .Y(n15) );
  FAX1 U19 ( .A(n27), .B(n29), .C(b[2]), .YC(n17), .YS(n18) );
  FAX1 U20 ( .A(n28), .B(n30), .C(b[1]), .YC(n19), .YS(n20) );
  FAX1 U21 ( .A(n29), .B(n31), .C(\b[0] ), .YC(n21), .YS(n22) );
  HAX1 U22 ( .A(n30), .B(n32), .YC(n23), .YS(n24) );
  HAX1 U23 ( .A(n31), .B(n33), .YC(n25), .YS(n26) );
  INVX2 U36 ( .A(b[5]), .Y(n29) );
  INVX2 U37 ( .A(b[6]), .Y(n28) );
  INVX2 U38 ( .A(b[7]), .Y(n27) );
  INVX2 U39 ( .A(\b[0] ), .Y(n12) );
  INVX2 U40 ( .A(b[2]), .Y(n32) );
  INVX2 U41 ( .A(b[3]), .Y(n31) );
  INVX2 U42 ( .A(b[4]), .Y(n30) );
  INVX2 U43 ( .A(b[1]), .Y(n33) );
endmodule


module rgbToGray2_DW_mult_uns_4 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n30, n31,
         n32, n33, n34, n35, n36, n37, \b[0] ;
  assign product[3] = \b[0] ;
  assign \b[0]  = b[0];

  XNOR2X1 U1 ( .A(n1), .B(n13), .Y(product[15]) );
  FAX1 U2 ( .A(n14), .B(n15), .C(n2), .YC(n1), .YS(product[14]) );
  FAX1 U3 ( .A(n17), .B(n16), .C(n3), .YC(n2), .YS(product[13]) );
  FAX1 U4 ( .A(n19), .B(n18), .C(n4), .YC(n3), .YS(product[12]) );
  FAX1 U5 ( .A(n20), .B(n21), .C(n5), .YC(n4), .YS(product[11]) );
  FAX1 U6 ( .A(n23), .B(n22), .C(n6), .YC(n5), .YS(product[10]) );
  FAX1 U7 ( .A(n25), .B(n24), .C(n7), .YC(n6), .YS(product[9]) );
  FAX1 U8 ( .A(n27), .B(n26), .C(n8), .YC(n7), .YS(product[8]) );
  FAX1 U9 ( .A(\b[0] ), .B(n28), .C(n9), .YC(n8), .YS(product[7]) );
  FAX1 U10 ( .A(n33), .B(\b[0] ), .C(n10), .YC(n9), .YS(product[6]) );
  HAX1 U11 ( .A(n34), .B(n11), .YC(n10), .YS(product[5]) );
  HAX1 U12 ( .A(n35), .B(n12), .YC(n11), .YS(product[4]) );
  INVX2 U14 ( .A(n13), .Y(n14) );
  XNOR2X1 U15 ( .A(n36), .B(n13), .Y(n16) );
  OR2X2 U16 ( .A(n36), .B(n13), .Y(n15) );
  XNOR2X1 U17 ( .A(n37), .B(n36), .Y(n18) );
  OR2X2 U18 ( .A(n37), .B(n36), .Y(n17) );
  XNOR2X1 U19 ( .A(b[4]), .B(n37), .Y(n20) );
  OR2X2 U20 ( .A(b[4]), .B(n37), .Y(n19) );
  FAX1 U21 ( .A(n14), .B(b[4]), .C(b[3]), .YC(n21), .YS(n22) );
  FAX1 U22 ( .A(n30), .B(b[3]), .C(b[2]), .YC(n23), .YS(n24) );
  FAX1 U23 ( .A(n31), .B(b[2]), .C(b[1]), .YC(n25), .YS(n26) );
  HAX1 U24 ( .A(n32), .B(b[1]), .YC(n27), .YS(n28) );
  INVX2 U40 ( .A(b[5]), .Y(n31) );
  INVX2 U41 ( .A(b[6]), .Y(n30) );
  INVX2 U42 ( .A(b[4]), .Y(n32) );
  INVX2 U43 ( .A(b[3]), .Y(n33) );
  INVX2 U44 ( .A(b[2]), .Y(n34) );
  INVX2 U45 ( .A(b[1]), .Y(n35) );
  BUFX2 U46 ( .A(b[7]), .Y(n13) );
  BUFX2 U47 ( .A(b[5]), .Y(n37) );
  BUFX2 U48 ( .A(b[6]), .Y(n36) );
  INVX2 U49 ( .A(\b[0] ), .Y(n12) );
endmodule


module rgbToGray2 ( clk, n_rst, inputData, grayPixel );
  input [31:0] inputData;
  output [7:0] grayPixel;
  input clk, n_rst;
  wire   N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33;
  wire   [13:0] r;
  wire   [15:0] g;
  wire   [12:0] b;
  wire   [15:8] total;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12;
  assign b[3] = inputData[2];
  assign b[2] = inputData[1];
  assign b[1] = inputData[0];

  DFFSR \grayTemp_reg[7]  ( .D(total[15]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        grayPixel[7]) );
  DFFSR \grayTemp_reg[6]  ( .D(total[14]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        grayPixel[6]) );
  DFFSR \grayTemp_reg[5]  ( .D(total[13]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        grayPixel[5]) );
  DFFSR \grayTemp_reg[4]  ( .D(total[12]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        grayPixel[4]) );
  DFFSR \grayTemp_reg[3]  ( .D(total[11]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        grayPixel[3]) );
  DFFSR \grayTemp_reg[2]  ( .D(total[10]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        grayPixel[2]) );
  DFFSR \grayTemp_reg[1]  ( .D(total[9]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        grayPixel[1]) );
  DFFSR \grayTemp_reg[0]  ( .D(total[8]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        grayPixel[0]) );
  rgbToGray2_DW01_add_0 add_0_root_add_34_2 ( .A({1'b0, 1'b0, 1'b0, b[12:1], 
        1'b0}), .B({N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, 
        N2, N1, 1'b0}), .CI(1'b0), .SUM({total, SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7}) );
  rgbToGray2_DW01_add_1 add_1_root_add_34_2 ( .A({1'b0, 1'b0, r[13:1], 1'b0}), 
        .B({g[15:3], 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM({N15, N14, N13, N12, 
        N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, SYNOPSYS_UNCONNECTED__8}) );
  rgbToGray2_DW_mult_uns_3 mult_29 ( .a({1'b1, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0}), 
        .b(inputData[23:16]), .product({r[13:1], SYNOPSYS_UNCONNECTED__9}) );
  rgbToGray2_DW_mult_uns_4 mult_30 ( .a({1'b1, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 
        1'b0, 1'b0}), .b(inputData[15:8]), .product({g[15:3], 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12}) );
  XOR2X1 U13 ( .A(n11), .B(inputData[5]), .Y(b[9]) );
  XOR2X1 U14 ( .A(n12), .B(n13), .Y(b[8]) );
  XOR2X1 U15 ( .A(n14), .B(inputData[7]), .Y(n12) );
  XOR2X1 U16 ( .A(n15), .B(n16), .Y(b[7]) );
  XOR2X1 U17 ( .A(n17), .B(inputData[6]), .Y(n15) );
  XNOR2X1 U18 ( .A(n18), .B(n19), .Y(b[6]) );
  XNOR2X1 U19 ( .A(b[3]), .B(inputData[5]), .Y(n18) );
  XOR2X1 U20 ( .A(n20), .B(n21), .Y(b[5]) );
  XOR2X1 U21 ( .A(n22), .B(inputData[4]), .Y(n21) );
  XOR2X1 U22 ( .A(inputData[3]), .B(b[1]), .Y(b[4]) );
  NOR2X1 U23 ( .A(n23), .B(n24), .Y(b[12]) );
  XOR2X1 U24 ( .A(n23), .B(n24), .Y(b[11]) );
  NAND3X1 U25 ( .A(inputData[5]), .B(n11), .C(inputData[6]), .Y(n24) );
  INVX1 U26 ( .A(inputData[7]), .Y(n23) );
  XNOR2X1 U27 ( .A(inputData[6]), .B(n25), .Y(b[10]) );
  NAND2X1 U28 ( .A(inputData[5]), .B(n11), .Y(n25) );
  OAI21X1 U29 ( .A(n13), .B(n14), .C(n26), .Y(n11) );
  OAI21X1 U30 ( .A(inputData[4]), .B(n27), .C(inputData[7]), .Y(n26) );
  INVX1 U31 ( .A(inputData[4]), .Y(n14) );
  INVX1 U32 ( .A(n27), .Y(n13) );
  OAI21X1 U33 ( .A(n16), .B(n17), .C(n28), .Y(n27) );
  OAI21X1 U34 ( .A(inputData[3]), .B(n29), .C(inputData[6]), .Y(n28) );
  INVX1 U35 ( .A(n16), .Y(n29) );
  INVX1 U36 ( .A(inputData[3]), .Y(n17) );
  AOI21X1 U37 ( .A(n19), .B(b[3]), .C(n30), .Y(n16) );
  INVX1 U38 ( .A(n31), .Y(n30) );
  OAI21X1 U39 ( .A(b[3]), .B(n19), .C(inputData[5]), .Y(n31) );
  OAI21X1 U40 ( .A(n20), .B(n22), .C(n32), .Y(n19) );
  OAI21X1 U41 ( .A(n33), .B(b[2]), .C(inputData[4]), .Y(n32) );
  INVX1 U42 ( .A(n20), .Y(n33) );
  INVX1 U43 ( .A(b[2]), .Y(n22) );
  NAND2X1 U44 ( .A(inputData[3]), .B(b[1]), .Y(n20) );
endmodule


module flex_counter ( clk, n_rst, clear, count_enable, colsFlag, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable, colsFlag;
  output rollover_flag;
  wire   n41, n42, n43, n44, n45, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37;

  DFFSR \count_out_reg[0]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  MUX2X1 U8 ( .B(n1), .A(n2), .S(n3), .Y(n45) );
  NAND2X1 U9 ( .A(n4), .B(n5), .Y(n2) );
  INVX1 U10 ( .A(count_out[0]), .Y(n1) );
  OAI22X1 U11 ( .A(n3), .B(n6), .C(n12), .D(n13), .Y(n44) );
  INVX1 U12 ( .A(count_out[1]), .Y(n6) );
  OAI22X1 U13 ( .A(n3), .B(n14), .C(n15), .D(n13), .Y(n43) );
  OAI22X1 U14 ( .A(n3), .B(n16), .C(n17), .D(n13), .Y(n42) );
  NAND3X1 U15 ( .A(n3), .B(n5), .C(n18), .Y(n13) );
  INVX1 U16 ( .A(n19), .Y(n41) );
  MUX2X1 U17 ( .B(rollover_flag), .A(n20), .S(n3), .Y(n19) );
  OR2X1 U18 ( .A(count_enable), .B(clear), .Y(n3) );
  NOR2X1 U19 ( .A(n21), .B(n22), .Y(n20) );
  NAND3X1 U20 ( .A(n23), .B(n24), .C(n25), .Y(n22) );
  XNOR2X1 U21 ( .A(rollover_val[0]), .B(n4), .Y(n25) );
  NAND2X1 U22 ( .A(n18), .B(count_out[0]), .Y(n4) );
  INVX1 U23 ( .A(n26), .Y(n18) );
  OAI21X1 U24 ( .A(rollover_val[1]), .B(n27), .C(n26), .Y(n23) );
  OAI22X1 U25 ( .A(rollover_val[3]), .B(n17), .C(n28), .D(n29), .Y(n26) );
  AOI22X1 U26 ( .A(n30), .B(n24), .C(n31), .D(n32), .Y(n29) );
  INVX1 U27 ( .A(rollover_val[2]), .Y(n32) );
  INVX1 U28 ( .A(n15), .Y(n31) );
  NAND2X1 U29 ( .A(rollover_val[1]), .B(n12), .Y(n24) );
  AND2X1 U30 ( .A(n33), .B(n34), .Y(n30) );
  OAI22X1 U31 ( .A(n12), .B(rollover_val[1]), .C(count_out[0]), .D(
        rollover_val[0]), .Y(n33) );
  OAI21X1 U32 ( .A(count_out[1]), .B(count_out[0]), .C(n35), .Y(n12) );
  INVX1 U33 ( .A(n36), .Y(n28) );
  OR2X1 U34 ( .A(rollover_val[2]), .B(rollover_val[3]), .Y(n27) );
  NAND3X1 U35 ( .A(n36), .B(n5), .C(n34), .Y(n21) );
  NAND2X1 U36 ( .A(rollover_val[2]), .B(n15), .Y(n34) );
  XOR2X1 U37 ( .A(n35), .B(count_out[2]), .Y(n15) );
  INVX1 U38 ( .A(clear), .Y(n5) );
  NAND2X1 U39 ( .A(rollover_val[3]), .B(n17), .Y(n36) );
  XOR2X1 U40 ( .A(n16), .B(n37), .Y(n17) );
  NOR2X1 U41 ( .A(n35), .B(n14), .Y(n37) );
  INVX1 U42 ( .A(count_out[2]), .Y(n14) );
  NAND2X1 U43 ( .A(count_out[1]), .B(count_out[0]), .Y(n35) );
  INVX1 U44 ( .A(count_out[3]), .Y(n16) );
endmodule


module concat2 ( clk, n_rst, pixel, numPixToLoad, count, grayReady, grayReady2, 
        matrix, s1, s2, s3, s4, s5, s6, s7, s8, s9 );
  input [7:0] pixel;
  input [3:0] numPixToLoad;
  input [3:0] count;
  output [71:0] matrix;
  output [7:0] s1;
  output [7:0] s2;
  output [7:0] s3;
  output [7:0] s4;
  output [7:0] s5;
  output [7:0] s6;
  output [7:0] s7;
  output [7:0] s8;
  output [7:0] s9;
  input clk, n_rst, grayReady, grayReady2;
  wire   \matrix[71] , \matrix[70] , \matrix[69] , \matrix[68] , \matrix[67] ,
         \matrix[66] , \matrix[65] , \matrix[64] , \matrix[63] , \matrix[62] ,
         \matrix[61] , \matrix[60] , \matrix[59] , \matrix[58] , \matrix[57] ,
         \matrix[56] , \matrix[55] , \matrix[54] , \matrix[53] , \matrix[52] ,
         \matrix[51] , \matrix[50] , \matrix[49] , \matrix[48] , \matrix[47] ,
         \matrix[46] , \matrix[45] , \matrix[44] , \matrix[43] , \matrix[42] ,
         \matrix[41] , \matrix[40] , \matrix[39] , \matrix[38] , \matrix[37] ,
         \matrix[36] , \matrix[35] , \matrix[34] , \matrix[33] , \matrix[32] ,
         \matrix[31] , \matrix[30] , \matrix[29] , \matrix[28] , \matrix[27] ,
         \matrix[26] , \matrix[25] , \matrix[24] , \matrix[23] , \matrix[22] ,
         \matrix[21] , \matrix[20] , \matrix[19] , \matrix[18] , \matrix[17] ,
         \matrix[16] , \matrix[15] , \matrix[14] , \matrix[13] , \matrix[12] ,
         \matrix[11] , \matrix[10] , \matrix[9] , \matrix[8] , \matrix[7] ,
         \matrix[6] , \matrix[5] , \matrix[4] , \matrix[3] , \matrix[2] ,
         \matrix[1] , \matrix[0] , N165, N166, N167, N168, N169, N170, N171,
         N172, N173, N174, N175, N176, N177, N178, N179, N180, N181, N182,
         N183, N184, N185, N186, N187, N188, N189, N190, N191, N192, N193,
         N194, N195, N196, N197, N198, N199, N200, N201, N202, N203, N204,
         N205, N206, N207, N208, N209, N210, N211, N212, N213, N214, N215,
         N216, N217, N218, N219, N220, N221, N222, N223, N224, N225, N226,
         N227, N228, N229, N230, N231, N232, N233, N234, N235, N236, N237, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259;
  wire   [7:0] t1;
  wire   [7:0] t2;
  wire   [7:0] t3;
  wire   [7:0] t4;
  wire   [7:0] t5;
  wire   [7:0] t6;
  wire   [7:0] t7;
  wire   [7:0] t8;
  wire   [7:0] t9;
  assign s1[7] = \matrix[71] ;
  assign matrix[71] = \matrix[71] ;
  assign s1[6] = \matrix[70] ;
  assign matrix[70] = \matrix[70] ;
  assign s1[5] = \matrix[69] ;
  assign matrix[69] = \matrix[69] ;
  assign s1[4] = \matrix[68] ;
  assign matrix[68] = \matrix[68] ;
  assign s1[3] = \matrix[67] ;
  assign matrix[67] = \matrix[67] ;
  assign s1[2] = \matrix[66] ;
  assign matrix[66] = \matrix[66] ;
  assign s1[1] = \matrix[65] ;
  assign matrix[65] = \matrix[65] ;
  assign s1[0] = \matrix[64] ;
  assign matrix[64] = \matrix[64] ;
  assign s2[7] = \matrix[63] ;
  assign matrix[63] = \matrix[63] ;
  assign s2[6] = \matrix[62] ;
  assign matrix[62] = \matrix[62] ;
  assign s2[5] = \matrix[61] ;
  assign matrix[61] = \matrix[61] ;
  assign s2[4] = \matrix[60] ;
  assign matrix[60] = \matrix[60] ;
  assign s2[3] = \matrix[59] ;
  assign matrix[59] = \matrix[59] ;
  assign s2[2] = \matrix[58] ;
  assign matrix[58] = \matrix[58] ;
  assign s2[1] = \matrix[57] ;
  assign matrix[57] = \matrix[57] ;
  assign s2[0] = \matrix[56] ;
  assign matrix[56] = \matrix[56] ;
  assign s3[7] = \matrix[55] ;
  assign matrix[55] = \matrix[55] ;
  assign s3[6] = \matrix[54] ;
  assign matrix[54] = \matrix[54] ;
  assign s3[5] = \matrix[53] ;
  assign matrix[53] = \matrix[53] ;
  assign s3[4] = \matrix[52] ;
  assign matrix[52] = \matrix[52] ;
  assign s3[3] = \matrix[51] ;
  assign matrix[51] = \matrix[51] ;
  assign s3[2] = \matrix[50] ;
  assign matrix[50] = \matrix[50] ;
  assign s3[1] = \matrix[49] ;
  assign matrix[49] = \matrix[49] ;
  assign s3[0] = \matrix[48] ;
  assign matrix[48] = \matrix[48] ;
  assign s4[7] = \matrix[47] ;
  assign matrix[47] = \matrix[47] ;
  assign s4[6] = \matrix[46] ;
  assign matrix[46] = \matrix[46] ;
  assign s4[5] = \matrix[45] ;
  assign matrix[45] = \matrix[45] ;
  assign s4[4] = \matrix[44] ;
  assign matrix[44] = \matrix[44] ;
  assign s4[3] = \matrix[43] ;
  assign matrix[43] = \matrix[43] ;
  assign s4[2] = \matrix[42] ;
  assign matrix[42] = \matrix[42] ;
  assign s4[1] = \matrix[41] ;
  assign matrix[41] = \matrix[41] ;
  assign s4[0] = \matrix[40] ;
  assign matrix[40] = \matrix[40] ;
  assign s5[7] = \matrix[39] ;
  assign matrix[39] = \matrix[39] ;
  assign s5[6] = \matrix[38] ;
  assign matrix[38] = \matrix[38] ;
  assign s5[5] = \matrix[37] ;
  assign matrix[37] = \matrix[37] ;
  assign s5[4] = \matrix[36] ;
  assign matrix[36] = \matrix[36] ;
  assign s5[3] = \matrix[35] ;
  assign matrix[35] = \matrix[35] ;
  assign s5[2] = \matrix[34] ;
  assign matrix[34] = \matrix[34] ;
  assign s5[1] = \matrix[33] ;
  assign matrix[33] = \matrix[33] ;
  assign s5[0] = \matrix[32] ;
  assign matrix[32] = \matrix[32] ;
  assign s6[7] = \matrix[31] ;
  assign matrix[31] = \matrix[31] ;
  assign s6[6] = \matrix[30] ;
  assign matrix[30] = \matrix[30] ;
  assign s6[5] = \matrix[29] ;
  assign matrix[29] = \matrix[29] ;
  assign s6[4] = \matrix[28] ;
  assign matrix[28] = \matrix[28] ;
  assign s6[3] = \matrix[27] ;
  assign matrix[27] = \matrix[27] ;
  assign s6[2] = \matrix[26] ;
  assign matrix[26] = \matrix[26] ;
  assign s6[1] = \matrix[25] ;
  assign matrix[25] = \matrix[25] ;
  assign s6[0] = \matrix[24] ;
  assign matrix[24] = \matrix[24] ;
  assign s7[7] = \matrix[23] ;
  assign matrix[23] = \matrix[23] ;
  assign s7[6] = \matrix[22] ;
  assign matrix[22] = \matrix[22] ;
  assign s7[5] = \matrix[21] ;
  assign matrix[21] = \matrix[21] ;
  assign s7[4] = \matrix[20] ;
  assign matrix[20] = \matrix[20] ;
  assign s7[3] = \matrix[19] ;
  assign matrix[19] = \matrix[19] ;
  assign s7[2] = \matrix[18] ;
  assign matrix[18] = \matrix[18] ;
  assign s7[1] = \matrix[17] ;
  assign matrix[17] = \matrix[17] ;
  assign s7[0] = \matrix[16] ;
  assign matrix[16] = \matrix[16] ;
  assign s8[7] = \matrix[15] ;
  assign matrix[15] = \matrix[15] ;
  assign s8[6] = \matrix[14] ;
  assign matrix[14] = \matrix[14] ;
  assign s8[5] = \matrix[13] ;
  assign matrix[13] = \matrix[13] ;
  assign s8[4] = \matrix[12] ;
  assign matrix[12] = \matrix[12] ;
  assign s8[3] = \matrix[11] ;
  assign matrix[11] = \matrix[11] ;
  assign s8[2] = \matrix[10] ;
  assign matrix[10] = \matrix[10] ;
  assign s8[1] = \matrix[9] ;
  assign matrix[9] = \matrix[9] ;
  assign s8[0] = \matrix[8] ;
  assign matrix[8] = \matrix[8] ;
  assign s9[7] = \matrix[7] ;
  assign matrix[7] = \matrix[7] ;
  assign s9[6] = \matrix[6] ;
  assign matrix[6] = \matrix[6] ;
  assign s9[5] = \matrix[5] ;
  assign matrix[5] = \matrix[5] ;
  assign s9[4] = \matrix[4] ;
  assign matrix[4] = \matrix[4] ;
  assign s9[3] = \matrix[3] ;
  assign matrix[3] = \matrix[3] ;
  assign s9[2] = \matrix[2] ;
  assign matrix[2] = \matrix[2] ;
  assign s9[1] = \matrix[1] ;
  assign matrix[1] = \matrix[1] ;
  assign s9[0] = \matrix[0] ;
  assign matrix[0] = \matrix[0] ;

  DFFSR \m9_reg[7]  ( .D(t9[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[7] ) );
  LATCH \t9_reg[7]  ( .CLK(n76), .D(N237), .Q(t9[7]) );
  DFFSR \m9_reg[6]  ( .D(t9[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[6] ) );
  LATCH \t9_reg[6]  ( .CLK(n76), .D(N236), .Q(t9[6]) );
  DFFSR \m9_reg[5]  ( .D(t9[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[5] ) );
  LATCH \t9_reg[5]  ( .CLK(n76), .D(N235), .Q(t9[5]) );
  DFFSR \m9_reg[4]  ( .D(t9[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[4] ) );
  LATCH \t9_reg[4]  ( .CLK(n76), .D(N234), .Q(t9[4]) );
  DFFSR \m9_reg[3]  ( .D(t9[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[3] ) );
  LATCH \t9_reg[3]  ( .CLK(n76), .D(N233), .Q(t9[3]) );
  DFFSR \m9_reg[2]  ( .D(t9[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[2] ) );
  LATCH \t9_reg[2]  ( .CLK(n76), .D(N232), .Q(t9[2]) );
  DFFSR \m9_reg[1]  ( .D(t9[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[1] ) );
  LATCH \t9_reg[1]  ( .CLK(n76), .D(N231), .Q(t9[1]) );
  DFFSR \m9_reg[0]  ( .D(t9[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[0] ) );
  LATCH \t9_reg[0]  ( .CLK(n76), .D(N230), .Q(t9[0]) );
  DFFSR \m3_reg[7]  ( .D(t3[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[55] ) );
  LATCH \t3_reg[7]  ( .CLK(n76), .D(N189), .Q(t3[7]) );
  LATCH \t2_reg[7]  ( .CLK(n76), .D(N181), .Q(t2[7]) );
  DFFSR \m2_reg[7]  ( .D(t2[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[63] ) );
  LATCH \t1_reg[7]  ( .CLK(n76), .D(N173), .Q(t1[7]) );
  DFFSR \m1_reg[7]  ( .D(t1[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[71] ) );
  DFFSR \m3_reg[6]  ( .D(t3[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[54] ) );
  LATCH \t3_reg[6]  ( .CLK(n76), .D(N188), .Q(t3[6]) );
  LATCH \t2_reg[6]  ( .CLK(n76), .D(N180), .Q(t2[6]) );
  DFFSR \m2_reg[6]  ( .D(t2[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[62] ) );
  LATCH \t1_reg[6]  ( .CLK(n76), .D(N172), .Q(t1[6]) );
  DFFSR \m1_reg[6]  ( .D(t1[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[70] ) );
  DFFSR \m3_reg[5]  ( .D(t3[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[53] ) );
  LATCH \t3_reg[5]  ( .CLK(n76), .D(N187), .Q(t3[5]) );
  LATCH \t2_reg[5]  ( .CLK(n76), .D(N179), .Q(t2[5]) );
  DFFSR \m2_reg[5]  ( .D(t2[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[61] ) );
  LATCH \t1_reg[5]  ( .CLK(n76), .D(N171), .Q(t1[5]) );
  DFFSR \m1_reg[5]  ( .D(t1[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[69] ) );
  DFFSR \m3_reg[4]  ( .D(t3[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[52] ) );
  LATCH \t3_reg[4]  ( .CLK(n76), .D(N186), .Q(t3[4]) );
  LATCH \t2_reg[4]  ( .CLK(n76), .D(N178), .Q(t2[4]) );
  DFFSR \m2_reg[4]  ( .D(t2[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[60] ) );
  LATCH \t1_reg[4]  ( .CLK(n76), .D(N170), .Q(t1[4]) );
  DFFSR \m1_reg[4]  ( .D(t1[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[68] ) );
  DFFSR \m3_reg[3]  ( .D(t3[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[51] ) );
  LATCH \t3_reg[3]  ( .CLK(n76), .D(N185), .Q(t3[3]) );
  LATCH \t2_reg[3]  ( .CLK(n76), .D(N177), .Q(t2[3]) );
  DFFSR \m2_reg[3]  ( .D(t2[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[59] ) );
  LATCH \t1_reg[3]  ( .CLK(n76), .D(N169), .Q(t1[3]) );
  DFFSR \m1_reg[3]  ( .D(t1[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[67] ) );
  DFFSR \m3_reg[2]  ( .D(t3[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[50] ) );
  LATCH \t3_reg[2]  ( .CLK(n76), .D(N184), .Q(t3[2]) );
  LATCH \t2_reg[2]  ( .CLK(n76), .D(N176), .Q(t2[2]) );
  DFFSR \m2_reg[2]  ( .D(t2[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[58] ) );
  LATCH \t1_reg[2]  ( .CLK(n76), .D(N168), .Q(t1[2]) );
  DFFSR \m1_reg[2]  ( .D(t1[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[66] ) );
  DFFSR \m3_reg[1]  ( .D(t3[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[49] ) );
  LATCH \t3_reg[1]  ( .CLK(n76), .D(N183), .Q(t3[1]) );
  LATCH \t2_reg[1]  ( .CLK(n76), .D(N175), .Q(t2[1]) );
  DFFSR \m2_reg[1]  ( .D(t2[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[57] ) );
  LATCH \t1_reg[1]  ( .CLK(n76), .D(N167), .Q(t1[1]) );
  DFFSR \m1_reg[1]  ( .D(t1[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[65] ) );
  DFFSR \m3_reg[0]  ( .D(t3[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[48] ) );
  LATCH \t3_reg[0]  ( .CLK(n76), .D(N182), .Q(t3[0]) );
  LATCH \t2_reg[0]  ( .CLK(n76), .D(N174), .Q(t2[0]) );
  DFFSR \m2_reg[0]  ( .D(t2[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[56] ) );
  LATCH \t1_reg[0]  ( .CLK(n76), .D(N166), .Q(t1[0]) );
  DFFSR \m1_reg[0]  ( .D(t1[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[64] ) );
  DFFSR \m6_reg[7]  ( .D(t6[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[31] ) );
  LATCH \t6_reg[7]  ( .CLK(n76), .D(N213), .Q(t6[7]) );
  LATCH \t5_reg[7]  ( .CLK(n76), .D(N205), .Q(t5[7]) );
  DFFSR \m5_reg[7]  ( .D(t5[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[39] ) );
  LATCH \t4_reg[7]  ( .CLK(n76), .D(N197), .Q(t4[7]) );
  DFFSR \m4_reg[7]  ( .D(t4[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[47] ) );
  DFFSR \m6_reg[6]  ( .D(t6[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[30] ) );
  LATCH \t6_reg[6]  ( .CLK(n76), .D(N212), .Q(t6[6]) );
  LATCH \t5_reg[6]  ( .CLK(n76), .D(N204), .Q(t5[6]) );
  DFFSR \m5_reg[6]  ( .D(t5[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[38] ) );
  LATCH \t4_reg[6]  ( .CLK(n76), .D(N196), .Q(t4[6]) );
  DFFSR \m4_reg[6]  ( .D(t4[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[46] ) );
  DFFSR \m6_reg[5]  ( .D(t6[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[29] ) );
  LATCH \t6_reg[5]  ( .CLK(n76), .D(N211), .Q(t6[5]) );
  LATCH \t5_reg[5]  ( .CLK(n76), .D(N203), .Q(t5[5]) );
  DFFSR \m5_reg[5]  ( .D(t5[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[37] ) );
  LATCH \t4_reg[5]  ( .CLK(n76), .D(N195), .Q(t4[5]) );
  DFFSR \m4_reg[5]  ( .D(t4[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[45] ) );
  DFFSR \m6_reg[4]  ( .D(t6[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[28] ) );
  LATCH \t6_reg[4]  ( .CLK(n76), .D(N210), .Q(t6[4]) );
  LATCH \t5_reg[4]  ( .CLK(n76), .D(N202), .Q(t5[4]) );
  DFFSR \m5_reg[4]  ( .D(t5[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[36] ) );
  LATCH \t4_reg[4]  ( .CLK(n76), .D(N194), .Q(t4[4]) );
  DFFSR \m4_reg[4]  ( .D(t4[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[44] ) );
  DFFSR \m6_reg[3]  ( .D(t6[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[27] ) );
  LATCH \t6_reg[3]  ( .CLK(n76), .D(N209), .Q(t6[3]) );
  LATCH \t5_reg[3]  ( .CLK(n76), .D(N201), .Q(t5[3]) );
  DFFSR \m5_reg[3]  ( .D(t5[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[35] ) );
  LATCH \t4_reg[3]  ( .CLK(n76), .D(N193), .Q(t4[3]) );
  DFFSR \m4_reg[3]  ( .D(t4[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[43] ) );
  DFFSR \m6_reg[2]  ( .D(t6[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[26] ) );
  LATCH \t6_reg[2]  ( .CLK(n76), .D(N208), .Q(t6[2]) );
  LATCH \t5_reg[2]  ( .CLK(n76), .D(N200), .Q(t5[2]) );
  DFFSR \m5_reg[2]  ( .D(t5[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[34] ) );
  LATCH \t4_reg[2]  ( .CLK(n76), .D(N192), .Q(t4[2]) );
  DFFSR \m4_reg[2]  ( .D(t4[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[42] ) );
  DFFSR \m6_reg[1]  ( .D(t6[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[25] ) );
  LATCH \t6_reg[1]  ( .CLK(n76), .D(N207), .Q(t6[1]) );
  LATCH \t5_reg[1]  ( .CLK(n76), .D(N199), .Q(t5[1]) );
  DFFSR \m5_reg[1]  ( .D(t5[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[33] ) );
  LATCH \t4_reg[1]  ( .CLK(n76), .D(N191), .Q(t4[1]) );
  DFFSR \m4_reg[1]  ( .D(t4[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[41] ) );
  DFFSR \m6_reg[0]  ( .D(t6[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[24] ) );
  LATCH \t6_reg[0]  ( .CLK(n76), .D(N206), .Q(t6[0]) );
  LATCH \t5_reg[0]  ( .CLK(n76), .D(N198), .Q(t5[0]) );
  DFFSR \m5_reg[0]  ( .D(t5[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[32] ) );
  LATCH \t4_reg[0]  ( .CLK(n76), .D(N190), .Q(t4[0]) );
  DFFSR \m4_reg[0]  ( .D(t4[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[40] ) );
  DFFSR \m8_reg[7]  ( .D(t8[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[15] ) );
  LATCH \t8_reg[7]  ( .CLK(n76), .D(N229), .Q(t8[7]) );
  LATCH \t7_reg[7]  ( .CLK(n76), .D(N221), .Q(t7[7]) );
  DFFSR \m7_reg[7]  ( .D(t7[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[23] ) );
  DFFSR \m8_reg[6]  ( .D(t8[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[14] ) );
  LATCH \t8_reg[6]  ( .CLK(n76), .D(N228), .Q(t8[6]) );
  LATCH \t7_reg[6]  ( .CLK(n76), .D(N220), .Q(t7[6]) );
  DFFSR \m7_reg[6]  ( .D(t7[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[22] ) );
  DFFSR \m8_reg[5]  ( .D(t8[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[13] ) );
  LATCH \t8_reg[5]  ( .CLK(n76), .D(N227), .Q(t8[5]) );
  LATCH \t7_reg[5]  ( .CLK(n76), .D(N219), .Q(t7[5]) );
  DFFSR \m7_reg[5]  ( .D(t7[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[21] ) );
  DFFSR \m8_reg[4]  ( .D(t8[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[12] ) );
  LATCH \t8_reg[4]  ( .CLK(n76), .D(N226), .Q(t8[4]) );
  LATCH \t7_reg[4]  ( .CLK(n76), .D(N218), .Q(t7[4]) );
  DFFSR \m7_reg[4]  ( .D(t7[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[20] ) );
  DFFSR \m8_reg[3]  ( .D(t8[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[11] ) );
  LATCH \t8_reg[3]  ( .CLK(n76), .D(N225), .Q(t8[3]) );
  LATCH \t7_reg[3]  ( .CLK(n76), .D(N217), .Q(t7[3]) );
  DFFSR \m7_reg[3]  ( .D(t7[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[19] ) );
  DFFSR \m8_reg[2]  ( .D(t8[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[10] ) );
  LATCH \t8_reg[2]  ( .CLK(n76), .D(N224), .Q(t8[2]) );
  LATCH \t7_reg[2]  ( .CLK(n76), .D(N216), .Q(t7[2]) );
  DFFSR \m7_reg[2]  ( .D(t7[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[18] ) );
  DFFSR \m8_reg[1]  ( .D(t8[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[9] ) );
  LATCH \t8_reg[1]  ( .CLK(n76), .D(N223), .Q(t8[1]) );
  LATCH \t7_reg[1]  ( .CLK(n76), .D(N215), .Q(t7[1]) );
  DFFSR \m7_reg[1]  ( .D(t7[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[17] ) );
  DFFSR \m8_reg[0]  ( .D(t8[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[8] ) );
  LATCH \t8_reg[0]  ( .CLK(n76), .D(N222), .Q(t8[0]) );
  LATCH \t7_reg[0]  ( .CLK(n76), .D(N214), .Q(t7[0]) );
  DFFSR \m7_reg[0]  ( .D(t7[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \matrix[16] ) );
  AND2X2 U75 ( .A(n228), .B(n103), .Y(n73) );
  INVX4 U76 ( .A(n73), .Y(n74) );
  INVX1 U77 ( .A(N165), .Y(n75) );
  INVX8 U78 ( .A(n75), .Y(n76) );
  OAI22X1 U79 ( .A(n77), .B(n78), .C(n79), .D(n80), .Y(N237) );
  OAI22X1 U80 ( .A(n77), .B(n81), .C(n79), .D(n82), .Y(N236) );
  OAI22X1 U81 ( .A(n77), .B(n83), .C(n79), .D(n84), .Y(N235) );
  OAI22X1 U82 ( .A(n77), .B(n85), .C(n79), .D(n86), .Y(N234) );
  OAI22X1 U83 ( .A(n77), .B(n87), .C(n79), .D(n88), .Y(N233) );
  OAI22X1 U84 ( .A(n77), .B(n89), .C(n79), .D(n90), .Y(N232) );
  OAI22X1 U85 ( .A(n77), .B(n91), .C(n79), .D(n92), .Y(N231) );
  OAI22X1 U86 ( .A(n77), .B(n93), .C(n79), .D(n94), .Y(N230) );
  MUX2X1 U87 ( .B(n95), .A(n96), .S(n97), .Y(n79) );
  NAND2X1 U88 ( .A(grayReady2), .B(n98), .Y(n96) );
  NAND2X1 U89 ( .A(n99), .B(n100), .Y(n95) );
  AOI22X1 U90 ( .A(n101), .B(n102), .C(n98), .D(n103), .Y(n77) );
  OAI21X1 U91 ( .A(n80), .B(n74), .C(n104), .Y(N229) );
  AOI22X1 U92 ( .A(\matrix[15] ), .B(n105), .C(n106), .D(n107), .Y(n104) );
  INVX1 U93 ( .A(\matrix[7] ), .Y(n80) );
  OAI21X1 U94 ( .A(n82), .B(n74), .C(n108), .Y(N228) );
  AOI22X1 U95 ( .A(\matrix[14] ), .B(n105), .C(n109), .D(n107), .Y(n108) );
  INVX1 U96 ( .A(\matrix[6] ), .Y(n82) );
  OAI21X1 U97 ( .A(n84), .B(n74), .C(n110), .Y(N227) );
  AOI22X1 U98 ( .A(\matrix[13] ), .B(n105), .C(n111), .D(n107), .Y(n110) );
  INVX1 U99 ( .A(\matrix[5] ), .Y(n84) );
  OAI21X1 U100 ( .A(n86), .B(n74), .C(n112), .Y(N226) );
  AOI22X1 U101 ( .A(\matrix[12] ), .B(n105), .C(n113), .D(n107), .Y(n112) );
  INVX1 U102 ( .A(\matrix[4] ), .Y(n86) );
  OAI21X1 U103 ( .A(n88), .B(n74), .C(n114), .Y(N225) );
  AOI22X1 U104 ( .A(\matrix[11] ), .B(n105), .C(n115), .D(n107), .Y(n114) );
  INVX1 U105 ( .A(\matrix[3] ), .Y(n88) );
  OAI21X1 U106 ( .A(n90), .B(n74), .C(n116), .Y(N224) );
  AOI22X1 U107 ( .A(\matrix[10] ), .B(n105), .C(n117), .D(n107), .Y(n116) );
  INVX1 U108 ( .A(\matrix[2] ), .Y(n90) );
  OAI21X1 U109 ( .A(n92), .B(n74), .C(n118), .Y(N223) );
  AOI22X1 U110 ( .A(\matrix[9] ), .B(n105), .C(n119), .D(n107), .Y(n118) );
  INVX1 U111 ( .A(\matrix[1] ), .Y(n92) );
  OAI21X1 U112 ( .A(n94), .B(n74), .C(n120), .Y(N222) );
  AOI22X1 U113 ( .A(\matrix[8] ), .B(n105), .C(n121), .D(n107), .Y(n120) );
  INVX1 U114 ( .A(n122), .Y(n107) );
  NAND2X1 U115 ( .A(n123), .B(n124), .Y(n105) );
  INVX1 U116 ( .A(\matrix[0] ), .Y(n94) );
  OAI21X1 U117 ( .A(n125), .B(n74), .C(n126), .Y(N221) );
  AOI22X1 U118 ( .A(\matrix[23] ), .B(n127), .C(n128), .D(pixel[7]), .Y(n126)
         );
  INVX1 U119 ( .A(\matrix[15] ), .Y(n125) );
  OAI21X1 U120 ( .A(n74), .B(n129), .C(n130), .Y(N220) );
  AOI22X1 U121 ( .A(\matrix[22] ), .B(n127), .C(n128), .D(pixel[6]), .Y(n130)
         );
  INVX1 U122 ( .A(\matrix[14] ), .Y(n129) );
  OAI21X1 U123 ( .A(n74), .B(n131), .C(n132), .Y(N219) );
  AOI22X1 U124 ( .A(\matrix[21] ), .B(n127), .C(n128), .D(pixel[5]), .Y(n132)
         );
  INVX1 U125 ( .A(\matrix[13] ), .Y(n131) );
  OAI21X1 U126 ( .A(n74), .B(n133), .C(n134), .Y(N218) );
  AOI22X1 U127 ( .A(\matrix[20] ), .B(n127), .C(n128), .D(pixel[4]), .Y(n134)
         );
  INVX1 U128 ( .A(\matrix[12] ), .Y(n133) );
  OAI21X1 U129 ( .A(n74), .B(n135), .C(n136), .Y(N217) );
  AOI22X1 U130 ( .A(\matrix[19] ), .B(n127), .C(n128), .D(pixel[3]), .Y(n136)
         );
  INVX1 U131 ( .A(\matrix[11] ), .Y(n135) );
  OAI21X1 U132 ( .A(n74), .B(n137), .C(n138), .Y(N216) );
  AOI22X1 U133 ( .A(\matrix[18] ), .B(n127), .C(n128), .D(pixel[2]), .Y(n138)
         );
  INVX1 U134 ( .A(\matrix[10] ), .Y(n137) );
  OAI21X1 U135 ( .A(n74), .B(n139), .C(n140), .Y(N215) );
  AOI22X1 U136 ( .A(\matrix[17] ), .B(n127), .C(n128), .D(pixel[1]), .Y(n140)
         );
  INVX1 U137 ( .A(\matrix[9] ), .Y(n139) );
  OAI21X1 U138 ( .A(n74), .B(n141), .C(n142), .Y(N214) );
  AOI22X1 U139 ( .A(\matrix[16] ), .B(n127), .C(n128), .D(pixel[0]), .Y(n142)
         );
  INVX1 U140 ( .A(n143), .Y(n128) );
  NAND2X1 U141 ( .A(n144), .B(n145), .Y(n127) );
  INVX1 U142 ( .A(\matrix[8] ), .Y(n141) );
  OAI22X1 U143 ( .A(n146), .B(n78), .C(n147), .D(n148), .Y(N213) );
  OAI22X1 U144 ( .A(n146), .B(n81), .C(n147), .D(n149), .Y(N212) );
  OAI22X1 U145 ( .A(n146), .B(n83), .C(n147), .D(n150), .Y(N211) );
  OAI22X1 U146 ( .A(n146), .B(n85), .C(n147), .D(n151), .Y(N210) );
  OAI22X1 U147 ( .A(n146), .B(n87), .C(n147), .D(n152), .Y(N209) );
  OAI22X1 U148 ( .A(n146), .B(n89), .C(n147), .D(n153), .Y(N208) );
  OAI22X1 U149 ( .A(n146), .B(n91), .C(n147), .D(n154), .Y(N207) );
  OAI22X1 U150 ( .A(n146), .B(n93), .C(n147), .D(n155), .Y(N206) );
  MUX2X1 U151 ( .B(n156), .A(n157), .S(n97), .Y(n147) );
  NAND2X1 U152 ( .A(n158), .B(grayReady2), .Y(n157) );
  NAND2X1 U153 ( .A(n159), .B(n160), .Y(n156) );
  INVX1 U154 ( .A(n161), .Y(n159) );
  AOI22X1 U155 ( .A(n101), .B(n162), .C(n103), .D(n158), .Y(n146) );
  OAI21X1 U156 ( .A(n74), .B(n148), .C(n163), .Y(N205) );
  AOI22X1 U157 ( .A(\matrix[39] ), .B(n164), .C(n165), .D(n106), .Y(n163) );
  INVX1 U158 ( .A(\matrix[31] ), .Y(n148) );
  OAI21X1 U159 ( .A(n74), .B(n149), .C(n166), .Y(N204) );
  AOI22X1 U160 ( .A(\matrix[38] ), .B(n164), .C(n165), .D(n109), .Y(n166) );
  INVX1 U161 ( .A(\matrix[30] ), .Y(n149) );
  OAI21X1 U162 ( .A(n74), .B(n150), .C(n167), .Y(N203) );
  AOI22X1 U163 ( .A(\matrix[37] ), .B(n164), .C(n165), .D(n111), .Y(n167) );
  INVX1 U164 ( .A(\matrix[29] ), .Y(n150) );
  OAI21X1 U165 ( .A(n74), .B(n151), .C(n168), .Y(N202) );
  AOI22X1 U166 ( .A(\matrix[36] ), .B(n164), .C(n165), .D(n113), .Y(n168) );
  INVX1 U167 ( .A(\matrix[28] ), .Y(n151) );
  OAI21X1 U168 ( .A(n74), .B(n152), .C(n169), .Y(N201) );
  AOI22X1 U169 ( .A(\matrix[35] ), .B(n164), .C(n165), .D(n115), .Y(n169) );
  INVX1 U170 ( .A(\matrix[27] ), .Y(n152) );
  OAI21X1 U171 ( .A(n74), .B(n153), .C(n170), .Y(N200) );
  AOI22X1 U172 ( .A(\matrix[34] ), .B(n164), .C(n165), .D(n117), .Y(n170) );
  INVX1 U173 ( .A(\matrix[26] ), .Y(n153) );
  OAI21X1 U174 ( .A(n74), .B(n154), .C(n171), .Y(N199) );
  AOI22X1 U175 ( .A(\matrix[33] ), .B(n164), .C(n165), .D(n119), .Y(n171) );
  INVX1 U176 ( .A(\matrix[25] ), .Y(n154) );
  OAI21X1 U177 ( .A(n74), .B(n155), .C(n172), .Y(N198) );
  AOI22X1 U178 ( .A(\matrix[32] ), .B(n164), .C(n165), .D(n121), .Y(n172) );
  INVX1 U179 ( .A(n145), .Y(n165) );
  NAND2X1 U180 ( .A(n144), .B(n143), .Y(n164) );
  NAND2X1 U181 ( .A(n98), .B(n101), .Y(n143) );
  AND2X1 U182 ( .A(n173), .B(n174), .Y(n144) );
  OAI21X1 U183 ( .A(n175), .B(n176), .C(n101), .Y(n174) );
  NAND2X1 U184 ( .A(n122), .B(n124), .Y(n175) );
  INVX1 U185 ( .A(\matrix[24] ), .Y(n155) );
  OAI21X1 U186 ( .A(n74), .B(n177), .C(n178), .Y(N197) );
  AOI22X1 U187 ( .A(\matrix[47] ), .B(n179), .C(n158), .D(n106), .Y(n178) );
  INVX1 U188 ( .A(\matrix[39] ), .Y(n177) );
  OAI21X1 U189 ( .A(n74), .B(n180), .C(n181), .Y(N196) );
  AOI22X1 U190 ( .A(\matrix[46] ), .B(n179), .C(n158), .D(n109), .Y(n181) );
  INVX1 U191 ( .A(\matrix[38] ), .Y(n180) );
  OAI21X1 U192 ( .A(n74), .B(n182), .C(n183), .Y(N195) );
  AOI22X1 U193 ( .A(\matrix[45] ), .B(n179), .C(n158), .D(n111), .Y(n183) );
  INVX1 U194 ( .A(\matrix[37] ), .Y(n182) );
  OAI21X1 U195 ( .A(n74), .B(n184), .C(n185), .Y(N194) );
  AOI22X1 U196 ( .A(\matrix[44] ), .B(n179), .C(n158), .D(n113), .Y(n185) );
  INVX1 U197 ( .A(\matrix[36] ), .Y(n184) );
  OAI21X1 U198 ( .A(n74), .B(n186), .C(n187), .Y(N193) );
  AOI22X1 U199 ( .A(\matrix[43] ), .B(n179), .C(n158), .D(n115), .Y(n187) );
  INVX1 U200 ( .A(\matrix[35] ), .Y(n186) );
  OAI21X1 U201 ( .A(n74), .B(n188), .C(n189), .Y(N192) );
  AOI22X1 U202 ( .A(\matrix[42] ), .B(n179), .C(n158), .D(n117), .Y(n189) );
  INVX1 U203 ( .A(\matrix[34] ), .Y(n188) );
  OAI21X1 U204 ( .A(n74), .B(n190), .C(n191), .Y(N191) );
  AOI22X1 U205 ( .A(\matrix[41] ), .B(n179), .C(n158), .D(n119), .Y(n191) );
  INVX1 U206 ( .A(\matrix[33] ), .Y(n190) );
  OAI21X1 U207 ( .A(n74), .B(n192), .C(n193), .Y(N190) );
  AOI22X1 U208 ( .A(\matrix[40] ), .B(n179), .C(n158), .D(n121), .Y(n193) );
  INVX1 U209 ( .A(n194), .Y(n158) );
  NAND2X1 U210 ( .A(n173), .B(n195), .Y(n179) );
  OAI21X1 U211 ( .A(n196), .B(n197), .C(n101), .Y(n195) );
  NAND2X1 U212 ( .A(n198), .B(n199), .Y(n197) );
  NAND2X1 U213 ( .A(n160), .B(n200), .Y(n196) );
  INVX1 U214 ( .A(\matrix[32] ), .Y(n192) );
  OAI22X1 U215 ( .A(n201), .B(n78), .C(n202), .D(n203), .Y(N189) );
  OAI22X1 U216 ( .A(n201), .B(n81), .C(n202), .D(n204), .Y(N188) );
  OAI22X1 U217 ( .A(n201), .B(n83), .C(n202), .D(n205), .Y(N187) );
  OAI22X1 U218 ( .A(n201), .B(n85), .C(n202), .D(n206), .Y(N186) );
  OAI22X1 U219 ( .A(n201), .B(n87), .C(n202), .D(n207), .Y(N185) );
  OAI22X1 U220 ( .A(n201), .B(n89), .C(n202), .D(n208), .Y(N184) );
  OAI22X1 U221 ( .A(n201), .B(n91), .C(n202), .D(n209), .Y(N183) );
  OAI22X1 U222 ( .A(n201), .B(n93), .C(n202), .D(n210), .Y(N182) );
  AND2X1 U223 ( .A(n173), .B(n211), .Y(n202) );
  OAI21X1 U224 ( .A(n162), .B(n161), .C(n101), .Y(n211) );
  NAND3X1 U225 ( .A(n199), .B(n194), .C(n198), .Y(n161) );
  INVX1 U226 ( .A(n212), .Y(n199) );
  INVX1 U227 ( .A(n200), .Y(n162) );
  INVX1 U228 ( .A(n213), .Y(n201) );
  OAI21X1 U229 ( .A(n97), .B(n160), .C(n74), .Y(n213) );
  OAI21X1 U230 ( .A(n74), .B(n203), .C(n214), .Y(N181) );
  AOI22X1 U231 ( .A(\matrix[63] ), .B(n215), .C(n216), .D(n106), .Y(n214) );
  INVX1 U232 ( .A(\matrix[55] ), .Y(n203) );
  OAI21X1 U233 ( .A(n74), .B(n204), .C(n217), .Y(N180) );
  AOI22X1 U234 ( .A(\matrix[62] ), .B(n215), .C(n216), .D(n109), .Y(n217) );
  INVX1 U235 ( .A(\matrix[54] ), .Y(n204) );
  OAI21X1 U236 ( .A(n74), .B(n205), .C(n218), .Y(N179) );
  AOI22X1 U237 ( .A(\matrix[61] ), .B(n215), .C(n216), .D(n111), .Y(n218) );
  INVX1 U238 ( .A(\matrix[53] ), .Y(n205) );
  OAI21X1 U239 ( .A(n74), .B(n206), .C(n219), .Y(N178) );
  AOI22X1 U240 ( .A(\matrix[60] ), .B(n215), .C(n216), .D(n113), .Y(n219) );
  INVX1 U241 ( .A(\matrix[52] ), .Y(n206) );
  OAI21X1 U242 ( .A(n74), .B(n207), .C(n220), .Y(N177) );
  AOI22X1 U243 ( .A(\matrix[59] ), .B(n215), .C(n216), .D(n115), .Y(n220) );
  INVX1 U244 ( .A(\matrix[51] ), .Y(n207) );
  OAI21X1 U245 ( .A(n74), .B(n208), .C(n221), .Y(N176) );
  AOI22X1 U246 ( .A(\matrix[58] ), .B(n215), .C(n216), .D(n117), .Y(n221) );
  INVX1 U247 ( .A(\matrix[50] ), .Y(n208) );
  OAI21X1 U248 ( .A(n74), .B(n209), .C(n222), .Y(N175) );
  AOI22X1 U249 ( .A(\matrix[57] ), .B(n215), .C(n216), .D(n119), .Y(n222) );
  INVX1 U250 ( .A(\matrix[49] ), .Y(n209) );
  OAI21X1 U251 ( .A(n74), .B(n210), .C(n223), .Y(N174) );
  AOI22X1 U252 ( .A(\matrix[56] ), .B(n215), .C(n216), .D(n121), .Y(n223) );
  NAND2X1 U253 ( .A(n123), .B(n122), .Y(n215) );
  AND2X1 U254 ( .A(n173), .B(n224), .Y(n123) );
  OAI21X1 U255 ( .A(n225), .B(n176), .C(n101), .Y(n224) );
  NAND2X1 U256 ( .A(n198), .B(n226), .Y(n176) );
  INVX1 U257 ( .A(n227), .Y(n226) );
  NOR2X1 U258 ( .A(n102), .B(n228), .Y(n198) );
  NAND2X1 U259 ( .A(n145), .B(n229), .Y(n225) );
  INVX1 U260 ( .A(\matrix[48] ), .Y(n210) );
  OAI21X1 U261 ( .A(n74), .B(n230), .C(n231), .Y(N173) );
  AOI22X1 U262 ( .A(n106), .B(n228), .C(\matrix[71] ), .D(n232), .Y(n231) );
  NOR2X1 U263 ( .A(n78), .B(n97), .Y(n106) );
  INVX1 U264 ( .A(pixel[7]), .Y(n78) );
  INVX1 U265 ( .A(\matrix[63] ), .Y(n230) );
  OAI21X1 U266 ( .A(n74), .B(n233), .C(n234), .Y(N172) );
  AOI22X1 U267 ( .A(n109), .B(n228), .C(\matrix[70] ), .D(n232), .Y(n234) );
  NOR2X1 U268 ( .A(n81), .B(n97), .Y(n109) );
  INVX1 U269 ( .A(pixel[6]), .Y(n81) );
  INVX1 U270 ( .A(\matrix[62] ), .Y(n233) );
  OAI21X1 U271 ( .A(n74), .B(n235), .C(n236), .Y(N171) );
  AOI22X1 U272 ( .A(n111), .B(n228), .C(\matrix[69] ), .D(n232), .Y(n236) );
  NOR2X1 U273 ( .A(n83), .B(n97), .Y(n111) );
  INVX1 U274 ( .A(pixel[5]), .Y(n83) );
  INVX1 U275 ( .A(\matrix[61] ), .Y(n235) );
  OAI21X1 U276 ( .A(n74), .B(n237), .C(n238), .Y(N170) );
  AOI22X1 U277 ( .A(n113), .B(n228), .C(\matrix[68] ), .D(n232), .Y(n238) );
  NOR2X1 U278 ( .A(n85), .B(n97), .Y(n113) );
  INVX1 U279 ( .A(pixel[4]), .Y(n85) );
  INVX1 U280 ( .A(\matrix[60] ), .Y(n237) );
  OAI21X1 U281 ( .A(n74), .B(n239), .C(n240), .Y(N169) );
  AOI22X1 U282 ( .A(n115), .B(n228), .C(\matrix[67] ), .D(n232), .Y(n240) );
  NOR2X1 U283 ( .A(n87), .B(n97), .Y(n115) );
  INVX1 U284 ( .A(pixel[3]), .Y(n87) );
  INVX1 U285 ( .A(\matrix[59] ), .Y(n239) );
  OAI21X1 U286 ( .A(n74), .B(n241), .C(n242), .Y(N168) );
  AOI22X1 U287 ( .A(n117), .B(n228), .C(\matrix[66] ), .D(n232), .Y(n242) );
  NOR2X1 U288 ( .A(n89), .B(n97), .Y(n117) );
  INVX1 U289 ( .A(pixel[2]), .Y(n89) );
  INVX1 U290 ( .A(\matrix[58] ), .Y(n241) );
  OAI21X1 U291 ( .A(n74), .B(n243), .C(n244), .Y(N167) );
  AOI22X1 U292 ( .A(n119), .B(n228), .C(\matrix[65] ), .D(n232), .Y(n244) );
  NOR2X1 U293 ( .A(n91), .B(n97), .Y(n119) );
  INVX1 U294 ( .A(pixel[1]), .Y(n91) );
  INVX1 U295 ( .A(\matrix[57] ), .Y(n243) );
  OAI21X1 U296 ( .A(n74), .B(n245), .C(n246), .Y(N166) );
  AOI22X1 U297 ( .A(\matrix[64] ), .B(n232), .C(n121), .D(n228), .Y(n246) );
  NOR2X1 U298 ( .A(n93), .B(n97), .Y(n121) );
  INVX1 U299 ( .A(pixel[0]), .Y(n93) );
  NAND3X1 U300 ( .A(n99), .B(n173), .C(n247), .Y(n232) );
  INVX1 U301 ( .A(n102), .Y(n247) );
  XOR2X1 U302 ( .A(n248), .B(count[3]), .Y(n102) );
  OAI21X1 U303 ( .A(n249), .B(n100), .C(n97), .Y(n173) );
  INVX1 U304 ( .A(n101), .Y(n97) );
  NOR2X1 U305 ( .A(n227), .B(n212), .Y(n99) );
  NAND3X1 U306 ( .A(n122), .B(n145), .C(n250), .Y(n212) );
  NOR2X1 U307 ( .A(n98), .B(n216), .Y(n250) );
  INVX1 U308 ( .A(n124), .Y(n216) );
  NAND3X1 U309 ( .A(count[2]), .B(n251), .C(n252), .Y(n124) );
  INVX1 U310 ( .A(n229), .Y(n98) );
  NAND3X1 U311 ( .A(n253), .B(n254), .C(count[1]), .Y(n229) );
  NAND3X1 U312 ( .A(n253), .B(n251), .C(count[2]), .Y(n145) );
  NAND3X1 U313 ( .A(count[2]), .B(count[1]), .C(n252), .Y(n122) );
  NAND3X1 U314 ( .A(n160), .B(n200), .C(n194), .Y(n227) );
  NAND3X1 U315 ( .A(count[1]), .B(n254), .C(n252), .Y(n194) );
  NOR2X1 U316 ( .A(count[3]), .B(count[0]), .Y(n252) );
  NAND2X1 U317 ( .A(count[3]), .B(n248), .Y(n200) );
  INVX1 U318 ( .A(n255), .Y(n248) );
  NAND3X1 U319 ( .A(n251), .B(n254), .C(n256), .Y(n255) );
  NAND3X1 U320 ( .A(count[1]), .B(n253), .C(count[2]), .Y(n160) );
  INVX1 U321 ( .A(\matrix[56] ), .Y(n245) );
  NOR2X1 U322 ( .A(n101), .B(n249), .Y(n103) );
  INVX1 U323 ( .A(grayReady2), .Y(n249) );
  INVX1 U324 ( .A(n100), .Y(n228) );
  NAND3X1 U325 ( .A(n251), .B(n254), .C(n253), .Y(n100) );
  NOR2X1 U326 ( .A(n256), .B(count[3]), .Y(n253) );
  INVX1 U327 ( .A(count[0]), .Y(n256) );
  INVX1 U328 ( .A(count[2]), .Y(n254) );
  INVX1 U329 ( .A(count[1]), .Y(n251) );
  OAI21X1 U330 ( .A(n257), .B(n258), .C(n101), .Y(N165) );
  NAND3X1 U331 ( .A(numPixToLoad[1]), .B(numPixToLoad[0]), .C(n259), .Y(n101)
         );
  NOR2X1 U332 ( .A(numPixToLoad[3]), .B(numPixToLoad[2]), .Y(n259) );
  NAND2X1 U333 ( .A(numPixToLoad[3]), .B(numPixToLoad[0]), .Y(n258) );
  OR2X1 U334 ( .A(numPixToLoad[1]), .B(numPixToLoad[2]), .Y(n257) );
endmodule


module sobel_DW01_add_0 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module sobel_DW01_add_1 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module sobel_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n8), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n9), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[3]), .Y(n6) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[1]), .Y(n8) );
  INVX2 U11 ( .A(B[0]), .Y(n9) );
endmodule


module sobel_DW01_add_2 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \A[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(n1), .YC(carry[3]), .YS(SUM[2]) );
  AND2X2 U1 ( .A(B[1]), .B(A[1]), .Y(n1) );
  XOR2X1 U2 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
endmodule


module sobel_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n8), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n9), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[3]), .Y(n6) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[1]), .Y(n8) );
  INVX2 U11 ( .A(B[0]), .Y(n9) );
endmodule


module sobel_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n8), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n9), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[3]), .Y(n6) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[1]), .Y(n8) );
  INVX2 U11 ( .A(B[0]), .Y(n9) );
endmodule


module sobel_DW01_add_3 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module sobel_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n8), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n9), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[3]), .Y(n6) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[1]), .Y(n8) );
  INVX2 U11 ( .A(B[0]), .Y(n9) );
endmodule


module sobel_DW01_add_4 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \A[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(n1), .YC(carry[3]), .YS(SUM[2]) );
  AND2X2 U1 ( .A(B[1]), .B(A[1]), .Y(n1) );
  XOR2X1 U2 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
endmodule


module sobel_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n8), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n9), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[3]), .Y(n6) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[1]), .Y(n8) );
  INVX2 U11 ( .A(B[0]), .Y(n9) );
endmodule


module sobel_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n8), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n9), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[3]), .Y(n6) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[1]), .Y(n8) );
  INVX2 U11 ( .A(B[0]), .Y(n9) );
endmodule


module sobel ( clk, n_rst, data, out );
  input [71:0] data;
  output [7:0] out;
  input clk, n_rst;
  wire   N80, \absGX[10] , N92, \absGY[10] , N9, N8, N78, N77, N76, N75, N74,
         N73, N72, N71, N70, N7, N69, N68, N67, N66, N65, N64, N63, N62, N61,
         N60, N6, N59, N58, N57, N56, N55, N54, N53, N52, N51, N50, N5, N49,
         N48, N47, N46, N45, N44, N43, N42, N41, N40, N4, N39, N38, N37, N36,
         N35, N34, N33, N32, N31, N30, N3, N29, N28, N27, N26, N25, N24, N23,
         N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n46, n47, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76;
  wire   [10:0] gX;
  wire   [10:0] gY;
  wire   [10:0] sum;

  sobel_DW01_add_0 add_40 ( .A({\absGX[10] , n67, n66, n65, n64, n63, n62, n61, 
        n60, n59, N80}), .B({\absGY[10] , n76, n75, n74, n73, n72, n71, n70, 
        n69, n68, N92}), .CI(1'b0), .SUM(sum) );
  sobel_DW01_add_1 add_0_root_add_35_2 ( .A({N78, N78, N78, N77, N76, N75, N74, 
        N73, N72, N71, N70}), .B({N69, N68, N67, N66, N65, N64, N63, N62, N61, 
        N60, N59}), .CI(1'b0), .SUM({gY[10:1], N92}) );
  sobel_DW01_sub_2 sub_35_3 ( .A({1'b0, data[55:48]}), .B({1'b0, data[7:0]}), 
        .CI(1'b0), .DIFF({N78, N77, N76, N75, N74, N73, N72, N71, N70}) );
  sobel_DW01_add_2 add_1_root_add_35_2 ( .A({N49, N49, N49, N48, N47, N46, N45, 
        N44, N43, N42, N41}), .B({N58, N58, N57, N56, N55, N54, N53, N52, N51, 
        N50, 1'b0}), .CI(1'b0), .SUM({N69, N68, N67, N66, N65, N64, N63, N62, 
        N61, N60, N59}) );
  sobel_DW01_sub_3 sub_35_2 ( .A({1'b0, data[63:56]}), .B({1'b0, data[15:8]}), 
        .CI(1'b0), .DIFF({N58, N57, N56, N55, N54, N53, N52, N51, N50}) );
  sobel_DW01_sub_4 sub_35 ( .A({1'b0, data[71:64]}), .B({1'b0, data[23:16]}), 
        .CI(1'b0), .DIFF({N49, N48, N47, N46, N45, N44, N43, N42, N41}) );
  sobel_DW01_add_3 add_0_root_add_34_2 ( .A({N40, N40, N40, N39, N38, N37, N36, 
        N35, N34, N33, N32}), .B({N31, N30, N29, N28, N27, N26, N25, N24, N23, 
        N22, N21}), .CI(1'b0), .SUM({gX[10:1], N80}) );
  sobel_DW01_sub_5 sub_34_3 ( .A({1'b0, data[7:0]}), .B({1'b0, data[23:16]}), 
        .CI(1'b0), .DIFF({N40, N39, N38, N37, N36, N35, N34, N33, N32}) );
  sobel_DW01_add_4 add_1_root_add_34_2 ( .A({N11, N11, N11, N10, N9, N8, N7, 
        N6, N5, N4, N3}), .B({N20, N20, N19, N18, N17, N16, N15, N14, N13, N12, 
        1'b0}), .CI(1'b0), .SUM({N31, N30, N29, N28, N27, N26, N25, N24, N23, 
        N22, N21}) );
  sobel_DW01_sub_6 sub_34_2 ( .A({1'b0, data[31:24]}), .B({1'b0, data[47:40]}), 
        .CI(1'b0), .DIFF({N20, N19, N18, N17, N16, N15, N14, N13, N12}) );
  sobel_DW01_sub_7 sub_34 ( .A({1'b0, data[55:48]}), .B({1'b0, data[71:64]}), 
        .CI(1'b0), .DIFF({N11, N10, N9, N8, N7, N6, N5, N4, N3}) );
  OR2X1 U7 ( .A(sum[7]), .B(n1), .Y(out[7]) );
  OR2X1 U8 ( .A(sum[6]), .B(n1), .Y(out[6]) );
  OR2X1 U9 ( .A(sum[5]), .B(n1), .Y(out[5]) );
  OR2X1 U10 ( .A(sum[4]), .B(n1), .Y(out[4]) );
  OR2X1 U11 ( .A(sum[3]), .B(n1), .Y(out[3]) );
  OR2X1 U12 ( .A(sum[2]), .B(n1), .Y(out[2]) );
  OR2X1 U13 ( .A(sum[1]), .B(n1), .Y(out[1]) );
  OR2X1 U14 ( .A(sum[0]), .B(n1), .Y(out[0]) );
  OR2X1 U15 ( .A(sum[10]), .B(n2), .Y(n1) );
  OR2X1 U16 ( .A(sum[9]), .B(sum[8]), .Y(n2) );
  XNOR2X1 U17 ( .A(gX[1]), .B(n3), .Y(n59) );
  NAND2X1 U18 ( .A(gX[10]), .B(N80), .Y(n3) );
  XNOR2X1 U19 ( .A(gX[2]), .B(n4), .Y(n60) );
  NAND2X1 U22 ( .A(gX[10]), .B(n5), .Y(n4) );
  XNOR2X1 U23 ( .A(gX[3]), .B(n6), .Y(n61) );
  NAND2X1 U30 ( .A(gX[10]), .B(n7), .Y(n6) );
  XNOR2X1 U31 ( .A(n8), .B(n9), .Y(n62) );
  NOR2X1 U32 ( .A(n10), .B(n11), .Y(n9) );
  XNOR2X1 U33 ( .A(gX[5]), .B(n12), .Y(n63) );
  NAND2X1 U34 ( .A(gX[10]), .B(n13), .Y(n12) );
  XNOR2X1 U35 ( .A(n14), .B(n15), .Y(n64) );
  NOR2X1 U36 ( .A(n16), .B(n11), .Y(n15) );
  XNOR2X1 U37 ( .A(gX[7]), .B(n17), .Y(n65) );
  NAND2X1 U38 ( .A(gX[10]), .B(n18), .Y(n17) );
  XNOR2X1 U39 ( .A(n19), .B(n20), .Y(n66) );
  NOR2X1 U40 ( .A(n21), .B(n11), .Y(n20) );
  XNOR2X1 U41 ( .A(gX[9]), .B(n22), .Y(n67) );
  NAND2X1 U42 ( .A(gX[10]), .B(n23), .Y(n22) );
  XNOR2X1 U43 ( .A(gY[1]), .B(n24), .Y(n68) );
  NAND2X1 U44 ( .A(gY[10]), .B(N92), .Y(n24) );
  XNOR2X1 U45 ( .A(gY[2]), .B(n25), .Y(n69) );
  NAND2X1 U46 ( .A(gY[10]), .B(n26), .Y(n25) );
  XNOR2X1 U47 ( .A(gY[3]), .B(n27), .Y(n70) );
  NAND2X1 U48 ( .A(gY[10]), .B(n28), .Y(n27) );
  XNOR2X1 U49 ( .A(n29), .B(n30), .Y(n71) );
  NOR2X1 U50 ( .A(n31), .B(n32), .Y(n30) );
  XNOR2X1 U51 ( .A(gY[5]), .B(n33), .Y(n72) );
  NAND2X1 U52 ( .A(gY[10]), .B(n34), .Y(n33) );
  XNOR2X1 U53 ( .A(n35), .B(n36), .Y(n73) );
  NOR2X1 U54 ( .A(n37), .B(n32), .Y(n36) );
  XNOR2X1 U55 ( .A(gY[7]), .B(n38), .Y(n74) );
  NAND2X1 U56 ( .A(gY[10]), .B(n39), .Y(n38) );
  XNOR2X1 U57 ( .A(n46), .B(n47), .Y(n75) );
  NOR2X1 U58 ( .A(n54), .B(n32), .Y(n47) );
  XNOR2X1 U59 ( .A(gY[9]), .B(n55), .Y(n76) );
  NAND2X1 U60 ( .A(gY[10]), .B(n56), .Y(n55) );
  NOR2X1 U61 ( .A(n56), .B(n57), .Y(\absGY[10] ) );
  OR2X1 U62 ( .A(n32), .B(gY[9]), .Y(n57) );
  INVX1 U63 ( .A(gY[10]), .Y(n32) );
  NAND2X1 U64 ( .A(n54), .B(n46), .Y(n56) );
  INVX1 U65 ( .A(gY[8]), .Y(n46) );
  NOR2X1 U66 ( .A(n39), .B(gY[7]), .Y(n54) );
  NAND2X1 U67 ( .A(n37), .B(n35), .Y(n39) );
  INVX1 U68 ( .A(gY[6]), .Y(n35) );
  NOR2X1 U69 ( .A(n34), .B(gY[5]), .Y(n37) );
  NAND2X1 U70 ( .A(n31), .B(n29), .Y(n34) );
  INVX1 U71 ( .A(gY[4]), .Y(n29) );
  NOR2X1 U72 ( .A(n28), .B(gY[3]), .Y(n31) );
  OR2X1 U73 ( .A(n26), .B(gY[2]), .Y(n28) );
  OR2X1 U74 ( .A(gY[1]), .B(N92), .Y(n26) );
  NOR2X1 U75 ( .A(n23), .B(n58), .Y(\absGX[10] ) );
  OR2X1 U76 ( .A(n11), .B(gX[9]), .Y(n58) );
  INVX1 U77 ( .A(gX[10]), .Y(n11) );
  NAND2X1 U78 ( .A(n21), .B(n19), .Y(n23) );
  INVX1 U79 ( .A(gX[8]), .Y(n19) );
  NOR2X1 U80 ( .A(n18), .B(gX[7]), .Y(n21) );
  NAND2X1 U81 ( .A(n16), .B(n14), .Y(n18) );
  INVX1 U82 ( .A(gX[6]), .Y(n14) );
  NOR2X1 U83 ( .A(n13), .B(gX[5]), .Y(n16) );
  NAND2X1 U84 ( .A(n10), .B(n8), .Y(n13) );
  INVX1 U85 ( .A(gX[4]), .Y(n8) );
  NOR2X1 U86 ( .A(n7), .B(gX[3]), .Y(n10) );
  OR2X1 U87 ( .A(n5), .B(gX[2]), .Y(n7) );
  OR2X1 U88 ( .A(gX[1]), .B(N80), .Y(n5) );
endmodule


module captureOutput2 ( clk, n_rst, holdIt, sobelValue, out, useIt, read, 
        write );
  input [7:0] sobelValue;
  output [31:0] out;
  output [31:0] read;
  output [31:0] write;
  input clk, n_rst, holdIt;
  output useIt;
  wire   holdIt, n19, n20, n21, n22, n23, n24, n25, n26, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17;
  wire   [7:0] temp3;
  assign write[1] = 1'b0;
  assign write[2] = 1'b0;
  assign write[3] = 1'b0;
  assign write[4] = 1'b0;
  assign write[5] = 1'b0;
  assign write[6] = 1'b0;
  assign write[7] = 1'b0;
  assign write[8] = 1'b0;
  assign write[9] = 1'b0;
  assign write[10] = 1'b0;
  assign write[11] = 1'b0;
  assign write[12] = 1'b0;
  assign write[13] = 1'b0;
  assign write[14] = 1'b0;
  assign write[15] = 1'b0;
  assign write[16] = 1'b0;
  assign write[17] = 1'b0;
  assign write[18] = 1'b0;
  assign write[19] = 1'b0;
  assign write[20] = 1'b0;
  assign write[21] = 1'b0;
  assign write[22] = 1'b0;
  assign write[23] = 1'b0;
  assign write[24] = 1'b0;
  assign write[25] = 1'b0;
  assign write[26] = 1'b0;
  assign write[27] = 1'b0;
  assign write[28] = 1'b0;
  assign write[29] = 1'b0;
  assign write[30] = 1'b0;
  assign write[31] = 1'b0;
  assign read[1] = 1'b0;
  assign read[2] = 1'b0;
  assign read[3] = 1'b0;
  assign read[4] = 1'b0;
  assign read[5] = 1'b0;
  assign read[6] = 1'b0;
  assign read[7] = 1'b0;
  assign read[8] = 1'b0;
  assign read[9] = 1'b0;
  assign read[10] = 1'b0;
  assign read[11] = 1'b0;
  assign read[12] = 1'b0;
  assign read[13] = 1'b0;
  assign read[14] = 1'b0;
  assign read[15] = 1'b0;
  assign read[16] = 1'b0;
  assign read[17] = 1'b0;
  assign read[18] = 1'b0;
  assign read[19] = 1'b0;
  assign read[20] = 1'b0;
  assign read[21] = 1'b0;
  assign read[22] = 1'b0;
  assign read[23] = 1'b0;
  assign read[24] = 1'b0;
  assign read[25] = 1'b0;
  assign read[26] = 1'b0;
  assign read[27] = 1'b0;
  assign read[28] = 1'b0;
  assign read[29] = 1'b0;
  assign read[30] = 1'b0;
  assign read[31] = 1'b0;
  assign out[8] = 1'b0;
  assign out[9] = 1'b0;
  assign out[10] = 1'b0;
  assign out[11] = 1'b0;
  assign out[12] = 1'b0;
  assign out[13] = 1'b0;
  assign out[14] = 1'b0;
  assign out[15] = 1'b0;
  assign out[16] = 1'b0;
  assign out[17] = 1'b0;
  assign out[18] = 1'b0;
  assign out[19] = 1'b0;
  assign out[20] = 1'b0;
  assign out[21] = 1'b0;
  assign out[22] = 1'b0;
  assign out[23] = 1'b0;
  assign out[24] = 1'b0;
  assign out[25] = 1'b0;
  assign out[26] = 1'b0;
  assign out[27] = 1'b0;
  assign out[28] = 1'b0;
  assign out[29] = 1'b0;
  assign out[30] = 1'b0;
  assign out[31] = 1'b0;
  assign write[0] = holdIt;
  assign useIt = holdIt;

  DFFPOSX1 \temp3_reg[7]  ( .D(n26), .CLK(clk), .Q(temp3[7]) );
  DFFPOSX1 \temp3_reg[6]  ( .D(n25), .CLK(clk), .Q(temp3[6]) );
  DFFPOSX1 \temp3_reg[5]  ( .D(n24), .CLK(clk), .Q(temp3[5]) );
  DFFPOSX1 \temp3_reg[4]  ( .D(n23), .CLK(clk), .Q(temp3[4]) );
  DFFPOSX1 \temp3_reg[3]  ( .D(n22), .CLK(clk), .Q(temp3[3]) );
  DFFPOSX1 \temp3_reg[2]  ( .D(n21), .CLK(clk), .Q(temp3[2]) );
  DFFPOSX1 \temp3_reg[1]  ( .D(n20), .CLK(clk), .Q(temp3[1]) );
  DFFPOSX1 \temp3_reg[0]  ( .D(n19), .CLK(clk), .Q(temp3[0]) );
  MUX2X1 U2 ( .B(n1), .A(n2), .S(read[0]), .Y(out[7]) );
  MUX2X1 U3 ( .B(n3), .A(n4), .S(read[0]), .Y(out[6]) );
  MUX2X1 U4 ( .B(n5), .A(n6), .S(read[0]), .Y(out[5]) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(read[0]), .Y(out[4]) );
  MUX2X1 U6 ( .B(n9), .A(n10), .S(read[0]), .Y(out[3]) );
  MUX2X1 U7 ( .B(n11), .A(n12), .S(read[0]), .Y(out[2]) );
  MUX2X1 U8 ( .B(n13), .A(n14), .S(read[0]), .Y(out[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(read[0]), .Y(out[0]) );
  INVX1 U10 ( .A(holdIt), .Y(read[0]) );
  MUX2X1 U11 ( .B(n2), .A(n1), .S(n17), .Y(n26) );
  INVX1 U12 ( .A(sobelValue[7]), .Y(n1) );
  INVX1 U13 ( .A(temp3[7]), .Y(n2) );
  MUX2X1 U14 ( .B(n4), .A(n3), .S(n17), .Y(n25) );
  INVX1 U15 ( .A(sobelValue[6]), .Y(n3) );
  INVX1 U16 ( .A(temp3[6]), .Y(n4) );
  MUX2X1 U17 ( .B(n6), .A(n5), .S(n17), .Y(n24) );
  INVX1 U18 ( .A(sobelValue[5]), .Y(n5) );
  INVX1 U19 ( .A(temp3[5]), .Y(n6) );
  MUX2X1 U20 ( .B(n8), .A(n7), .S(n17), .Y(n23) );
  INVX1 U21 ( .A(sobelValue[4]), .Y(n7) );
  INVX1 U22 ( .A(temp3[4]), .Y(n8) );
  MUX2X1 U23 ( .B(n10), .A(n9), .S(n17), .Y(n22) );
  INVX1 U24 ( .A(sobelValue[3]), .Y(n9) );
  INVX1 U25 ( .A(temp3[3]), .Y(n10) );
  MUX2X1 U26 ( .B(n12), .A(n11), .S(n17), .Y(n21) );
  INVX1 U27 ( .A(sobelValue[2]), .Y(n11) );
  INVX1 U28 ( .A(temp3[2]), .Y(n12) );
  MUX2X1 U29 ( .B(n14), .A(n13), .S(n17), .Y(n20) );
  INVX1 U30 ( .A(sobelValue[1]), .Y(n13) );
  INVX1 U31 ( .A(temp3[1]), .Y(n14) );
  MUX2X1 U32 ( .B(n16), .A(n15), .S(n17), .Y(n19) );
  AND2X1 U33 ( .A(n_rst), .B(holdIt), .Y(n17) );
  INVX1 U34 ( .A(sobelValue[0]), .Y(n15) );
  INVX1 U35 ( .A(temp3[0]), .Y(n16) );
endmodule


module edgeDetection2 ( clk, n_rst, startSignal, inputData, rwError, readDone, 
        writeDone, readAddress, writeAddress, outputData, readEnable, 
        writeEnable, outputError );
  input [31:0] startSignal;
  input [31:0] inputData;
  input [31:0] rwError;
  input [31:0] readDone;
  input [31:0] writeDone;
  output [31:0] readAddress;
  output [31:0] writeAddress;
  output [31:0] outputData;
  output [31:0] readEnable;
  output [31:0] writeEnable;
  output [31:0] outputError;
  input clk, n_rst;
  wire   executeRead, grayReady, grayReady2, assertWrite, startSobel,
         cols_rollover_flag, _0_net_;
  wire   [3:0] numPixToLoad;
  wire   [3:0] countOut;
  wire   [31:0] writeEnableTempSignal;
  wire   [1:0] rowCount;
  wire   [9:0] colCount;
  wire   [8:0] offsetCount;
  wire   [7:0] grayPixel;
  wire   [71:0] matrix;
  wire   [7:0] sobelData;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35, 
        SYNOPSYS_UNCONNECTED__36, SYNOPSYS_UNCONNECTED__37, 
        SYNOPSYS_UNCONNECTED__38, SYNOPSYS_UNCONNECTED__39, 
        SYNOPSYS_UNCONNECTED__40, SYNOPSYS_UNCONNECTED__41, 
        SYNOPSYS_UNCONNECTED__42, SYNOPSYS_UNCONNECTED__43, 
        SYNOPSYS_UNCONNECTED__44, SYNOPSYS_UNCONNECTED__45, 
        SYNOPSYS_UNCONNECTED__46, SYNOPSYS_UNCONNECTED__47, 
        SYNOPSYS_UNCONNECTED__48, SYNOPSYS_UNCONNECTED__49, 
        SYNOPSYS_UNCONNECTED__50, SYNOPSYS_UNCONNECTED__51, 
        SYNOPSYS_UNCONNECTED__52, SYNOPSYS_UNCONNECTED__53, 
        SYNOPSYS_UNCONNECTED__54, SYNOPSYS_UNCONNECTED__55, 
        SYNOPSYS_UNCONNECTED__56, SYNOPSYS_UNCONNECTED__57, 
        SYNOPSYS_UNCONNECTED__58, SYNOPSYS_UNCONNECTED__59, 
        SYNOPSYS_UNCONNECTED__60, SYNOPSYS_UNCONNECTED__61, 
        SYNOPSYS_UNCONNECTED__62, SYNOPSYS_UNCONNECTED__63, 
        SYNOPSYS_UNCONNECTED__64, SYNOPSYS_UNCONNECTED__65, 
        SYNOPSYS_UNCONNECTED__66, SYNOPSYS_UNCONNECTED__67, 
        SYNOPSYS_UNCONNECTED__68, SYNOPSYS_UNCONNECTED__69, 
        SYNOPSYS_UNCONNECTED__70, SYNOPSYS_UNCONNECTED__71, 
        SYNOPSYS_UNCONNECTED__72, SYNOPSYS_UNCONNECTED__73, 
        SYNOPSYS_UNCONNECTED__74, SYNOPSYS_UNCONNECTED__75, 
        SYNOPSYS_UNCONNECTED__76, SYNOPSYS_UNCONNECTED__77, 
        SYNOPSYS_UNCONNECTED__78, SYNOPSYS_UNCONNECTED__79, 
        SYNOPSYS_UNCONNECTED__80, SYNOPSYS_UNCONNECTED__81, 
        SYNOPSYS_UNCONNECTED__82, SYNOPSYS_UNCONNECTED__83, 
        SYNOPSYS_UNCONNECTED__84, SYNOPSYS_UNCONNECTED__85, 
        SYNOPSYS_UNCONNECTED__86, SYNOPSYS_UNCONNECTED__87, 
        SYNOPSYS_UNCONNECTED__88, SYNOPSYS_UNCONNECTED__89, 
        SYNOPSYS_UNCONNECTED__90, SYNOPSYS_UNCONNECTED__91, 
        SYNOPSYS_UNCONNECTED__92, SYNOPSYS_UNCONNECTED__93, 
        SYNOPSYS_UNCONNECTED__94, SYNOPSYS_UNCONNECTED__95, 
        SYNOPSYS_UNCONNECTED__96, SYNOPSYS_UNCONNECTED__97, 
        SYNOPSYS_UNCONNECTED__98, SYNOPSYS_UNCONNECTED__99, 
        SYNOPSYS_UNCONNECTED__100, SYNOPSYS_UNCONNECTED__101, 
        SYNOPSYS_UNCONNECTED__102, SYNOPSYS_UNCONNECTED__103, 
        SYNOPSYS_UNCONNECTED__104, SYNOPSYS_UNCONNECTED__105, 
        SYNOPSYS_UNCONNECTED__106, SYNOPSYS_UNCONNECTED__107, 
        SYNOPSYS_UNCONNECTED__108, SYNOPSYS_UNCONNECTED__109, 
        SYNOPSYS_UNCONNECTED__110, SYNOPSYS_UNCONNECTED__111, 
        SYNOPSYS_UNCONNECTED__112, SYNOPSYS_UNCONNECTED__113, 
        SYNOPSYS_UNCONNECTED__114, SYNOPSYS_UNCONNECTED__115, 
        SYNOPSYS_UNCONNECTED__116, SYNOPSYS_UNCONNECTED__117, 
        SYNOPSYS_UNCONNECTED__118, SYNOPSYS_UNCONNECTED__119, 
        SYNOPSYS_UNCONNECTED__120, SYNOPSYS_UNCONNECTED__121, 
        SYNOPSYS_UNCONNECTED__122, SYNOPSYS_UNCONNECTED__123, 
        SYNOPSYS_UNCONNECTED__124, SYNOPSYS_UNCONNECTED__125, 
        SYNOPSYS_UNCONNECTED__126, SYNOPSYS_UNCONNECTED__127, 
        SYNOPSYS_UNCONNECTED__128, SYNOPSYS_UNCONNECTED__129, 
        SYNOPSYS_UNCONNECTED__130, SYNOPSYS_UNCONNECTED__131, 
        SYNOPSYS_UNCONNECTED__132, SYNOPSYS_UNCONNECTED__133, 
        SYNOPSYS_UNCONNECTED__134, SYNOPSYS_UNCONNECTED__135, 
        SYNOPSYS_UNCONNECTED__136, SYNOPSYS_UNCONNECTED__137, 
        SYNOPSYS_UNCONNECTED__138, SYNOPSYS_UNCONNECTED__139, 
        SYNOPSYS_UNCONNECTED__140, SYNOPSYS_UNCONNECTED__141, 
        SYNOPSYS_UNCONNECTED__142, SYNOPSYS_UNCONNECTED__143, 
        SYNOPSYS_UNCONNECTED__144, SYNOPSYS_UNCONNECTED__145, 
        SYNOPSYS_UNCONNECTED__146, SYNOPSYS_UNCONNECTED__147, 
        SYNOPSYS_UNCONNECTED__148, SYNOPSYS_UNCONNECTED__149, 
        SYNOPSYS_UNCONNECTED__150, SYNOPSYS_UNCONNECTED__151, 
        SYNOPSYS_UNCONNECTED__152, SYNOPSYS_UNCONNECTED__153, 
        SYNOPSYS_UNCONNECTED__154, SYNOPSYS_UNCONNECTED__155, 
        SYNOPSYS_UNCONNECTED__156, SYNOPSYS_UNCONNECTED__157, 
        SYNOPSYS_UNCONNECTED__158, SYNOPSYS_UNCONNECTED__159, 
        SYNOPSYS_UNCONNECTED__160, SYNOPSYS_UNCONNECTED__161, 
        SYNOPSYS_UNCONNECTED__162;
  assign readAddress[31] = 1'b0;
  assign readAddress[30] = 1'b0;
  assign readAddress[29] = 1'b0;
  assign readAddress[28] = 1'b0;
  assign readAddress[27] = 1'b0;
  assign readAddress[26] = 1'b0;
  assign readAddress[4] = 1'b0;
  assign readAddress[3] = 1'b0;
  assign readAddress[2] = 1'b0;
  assign readAddress[1] = 1'b0;
  assign readAddress[0] = 1'b0;
  assign outputData[31] = 1'b0;
  assign outputData[30] = 1'b0;
  assign outputData[29] = 1'b0;
  assign outputData[28] = 1'b0;
  assign outputData[27] = 1'b0;
  assign outputData[26] = 1'b0;
  assign outputData[25] = 1'b0;
  assign outputData[24] = 1'b0;
  assign outputData[23] = 1'b0;
  assign outputData[22] = 1'b0;
  assign outputData[21] = 1'b0;
  assign outputData[20] = 1'b0;
  assign outputData[19] = 1'b0;
  assign outputData[18] = 1'b0;
  assign outputData[17] = 1'b0;
  assign outputData[16] = 1'b0;
  assign outputData[15] = 1'b0;
  assign outputData[14] = 1'b0;
  assign outputData[13] = 1'b0;
  assign outputData[12] = 1'b0;
  assign outputData[11] = 1'b0;
  assign outputData[10] = 1'b0;
  assign outputData[9] = 1'b0;
  assign outputData[8] = 1'b0;
  assign readEnable[31] = 1'b0;
  assign readEnable[30] = 1'b0;
  assign readEnable[29] = 1'b0;
  assign readEnable[28] = 1'b0;
  assign readEnable[27] = 1'b0;
  assign readEnable[26] = 1'b0;
  assign readEnable[25] = 1'b0;
  assign readEnable[24] = 1'b0;
  assign readEnable[23] = 1'b0;
  assign readEnable[22] = 1'b0;
  assign readEnable[21] = 1'b0;
  assign readEnable[20] = 1'b0;
  assign readEnable[19] = 1'b0;
  assign readEnable[18] = 1'b0;
  assign readEnable[17] = 1'b0;
  assign readEnable[16] = 1'b0;
  assign readEnable[15] = 1'b0;
  assign readEnable[14] = 1'b0;
  assign readEnable[13] = 1'b0;
  assign readEnable[12] = 1'b0;
  assign readEnable[11] = 1'b0;
  assign readEnable[10] = 1'b0;
  assign readEnable[9] = 1'b0;
  assign readEnable[8] = 1'b0;
  assign readEnable[7] = 1'b0;
  assign readEnable[6] = 1'b0;
  assign readEnable[5] = 1'b0;
  assign readEnable[4] = 1'b0;
  assign readEnable[3] = 1'b0;
  assign readEnable[2] = 1'b0;
  assign readEnable[1] = 1'b0;
  assign writeEnable[31] = 1'b0;
  assign writeEnable[30] = 1'b0;
  assign writeEnable[29] = 1'b0;
  assign writeEnable[28] = 1'b0;
  assign writeEnable[27] = 1'b0;
  assign writeEnable[26] = 1'b0;
  assign writeEnable[25] = 1'b0;
  assign writeEnable[24] = 1'b0;
  assign writeEnable[23] = 1'b0;
  assign writeEnable[22] = 1'b0;
  assign writeEnable[21] = 1'b0;
  assign writeEnable[20] = 1'b0;
  assign writeEnable[19] = 1'b0;
  assign writeEnable[18] = 1'b0;
  assign writeEnable[17] = 1'b0;
  assign writeEnable[16] = 1'b0;
  assign writeEnable[15] = 1'b0;
  assign writeEnable[14] = 1'b0;
  assign writeEnable[13] = 1'b0;
  assign writeEnable[12] = 1'b0;
  assign writeEnable[11] = 1'b0;
  assign writeEnable[10] = 1'b0;
  assign writeEnable[9] = 1'b0;
  assign writeEnable[8] = 1'b0;
  assign writeEnable[7] = 1'b0;
  assign writeEnable[6] = 1'b0;
  assign writeEnable[5] = 1'b0;
  assign writeEnable[4] = 1'b0;
  assign writeEnable[3] = 1'b0;
  assign writeEnable[2] = 1'b0;
  assign writeEnable[1] = 1'b0;
  assign outputError[31] = 1'b0;
  assign outputError[30] = 1'b0;
  assign outputError[29] = 1'b0;
  assign outputError[28] = 1'b0;
  assign outputError[27] = 1'b0;
  assign outputError[26] = 1'b0;
  assign outputError[25] = 1'b0;
  assign outputError[24] = 1'b0;
  assign outputError[23] = 1'b0;
  assign outputError[22] = 1'b0;
  assign outputError[21] = 1'b0;
  assign outputError[20] = 1'b0;
  assign outputError[19] = 1'b0;
  assign outputError[18] = 1'b0;
  assign outputError[17] = 1'b0;
  assign outputError[16] = 1'b0;
  assign outputError[15] = 1'b0;
  assign outputError[14] = 1'b0;
  assign outputError[13] = 1'b0;
  assign outputError[12] = 1'b0;
  assign outputError[11] = 1'b0;
  assign outputError[10] = 1'b0;
  assign outputError[9] = 1'b0;
  assign outputError[8] = 1'b0;
  assign outputError[7] = 1'b0;
  assign outputError[6] = 1'b0;
  assign outputError[5] = 1'b0;
  assign outputError[4] = 1'b0;
  assign outputError[3] = 1'b0;
  assign outputError[2] = 1'b0;
  assign outputError[1] = 1'b0;
  assign readAddress[24] = 1'b0;
  assign readAddress[25] = 1'b0;

  controller2 controller ( .clk(clk), .n_rst(n_rst), .startSignal(startSignal), 
        .readDone(readDone), .rwError(rwError), .countVal({numPixToLoad[3], 
        1'b0, numPixToLoad[1], 1'b1}), .countOut(countOut), 
        .signalToAssertWriteEnable({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        writeEnableTempSignal[0]}), .writeDone(writeDone), .executeRead(
        executeRead), .readEnable({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17, SYNOPSYS_UNCONNECTED__18, 
        SYNOPSYS_UNCONNECTED__19, SYNOPSYS_UNCONNECTED__20, 
        SYNOPSYS_UNCONNECTED__21, SYNOPSYS_UNCONNECTED__22, 
        SYNOPSYS_UNCONNECTED__23, SYNOPSYS_UNCONNECTED__24, 
        SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28, 
        SYNOPSYS_UNCONNECTED__29, SYNOPSYS_UNCONNECTED__30, readEnable[0]}), 
        .outputError({SYNOPSYS_UNCONNECTED__31, SYNOPSYS_UNCONNECTED__32, 
        SYNOPSYS_UNCONNECTED__33, SYNOPSYS_UNCONNECTED__34, 
        SYNOPSYS_UNCONNECTED__35, SYNOPSYS_UNCONNECTED__36, 
        SYNOPSYS_UNCONNECTED__37, SYNOPSYS_UNCONNECTED__38, 
        SYNOPSYS_UNCONNECTED__39, SYNOPSYS_UNCONNECTED__40, 
        SYNOPSYS_UNCONNECTED__41, SYNOPSYS_UNCONNECTED__42, 
        SYNOPSYS_UNCONNECTED__43, SYNOPSYS_UNCONNECTED__44, 
        SYNOPSYS_UNCONNECTED__45, SYNOPSYS_UNCONNECTED__46, 
        SYNOPSYS_UNCONNECTED__47, SYNOPSYS_UNCONNECTED__48, 
        SYNOPSYS_UNCONNECTED__49, SYNOPSYS_UNCONNECTED__50, 
        SYNOPSYS_UNCONNECTED__51, SYNOPSYS_UNCONNECTED__52, 
        SYNOPSYS_UNCONNECTED__53, SYNOPSYS_UNCONNECTED__54, 
        SYNOPSYS_UNCONNECTED__55, SYNOPSYS_UNCONNECTED__56, 
        SYNOPSYS_UNCONNECTED__57, SYNOPSYS_UNCONNECTED__58, 
        SYNOPSYS_UNCONNECTED__59, SYNOPSYS_UNCONNECTED__60, 
        SYNOPSYS_UNCONNECTED__61, outputError[0]}), .grayReady(grayReady), 
        .grayReady2(grayReady2), .writeEnable(assertWrite), .realOutputEnable(
        {SYNOPSYS_UNCONNECTED__62, SYNOPSYS_UNCONNECTED__63, 
        SYNOPSYS_UNCONNECTED__64, SYNOPSYS_UNCONNECTED__65, 
        SYNOPSYS_UNCONNECTED__66, SYNOPSYS_UNCONNECTED__67, 
        SYNOPSYS_UNCONNECTED__68, SYNOPSYS_UNCONNECTED__69, 
        SYNOPSYS_UNCONNECTED__70, SYNOPSYS_UNCONNECTED__71, 
        SYNOPSYS_UNCONNECTED__72, SYNOPSYS_UNCONNECTED__73, 
        SYNOPSYS_UNCONNECTED__74, SYNOPSYS_UNCONNECTED__75, 
        SYNOPSYS_UNCONNECTED__76, SYNOPSYS_UNCONNECTED__77, 
        SYNOPSYS_UNCONNECTED__78, SYNOPSYS_UNCONNECTED__79, 
        SYNOPSYS_UNCONNECTED__80, SYNOPSYS_UNCONNECTED__81, 
        SYNOPSYS_UNCONNECTED__82, SYNOPSYS_UNCONNECTED__83, 
        SYNOPSYS_UNCONNECTED__84, SYNOPSYS_UNCONNECTED__85, 
        SYNOPSYS_UNCONNECTED__86, SYNOPSYS_UNCONNECTED__87, 
        SYNOPSYS_UNCONNECTED__88, SYNOPSYS_UNCONNECTED__89, 
        SYNOPSYS_UNCONNECTED__90, SYNOPSYS_UNCONNECTED__91, 
        SYNOPSYS_UNCONNECTED__92, writeEnable[0]}) );
  readController readController ( .clk(clk), .n_rst(n_rst), .rowCount(rowCount), .colCount(colCount), .offsetCount(offsetCount), .startSobel(startSobel), 
        .executeRead(executeRead), .readAddress({SYNOPSYS_UNCONNECTED__93, 
        SYNOPSYS_UNCONNECTED__94, SYNOPSYS_UNCONNECTED__95, 
        SYNOPSYS_UNCONNECTED__96, SYNOPSYS_UNCONNECTED__97, 
        SYNOPSYS_UNCONNECTED__98, SYNOPSYS_UNCONNECTED__99, 
        SYNOPSYS_UNCONNECTED__100, readAddress[23:5], 
        SYNOPSYS_UNCONNECTED__101, SYNOPSYS_UNCONNECTED__102, 
        SYNOPSYS_UNCONNECTED__103, SYNOPSYS_UNCONNECTED__104, 
        SYNOPSYS_UNCONNECTED__105}), .numPixToLoad({numPixToLoad[3], 
        SYNOPSYS_UNCONNECTED__106, numPixToLoad[1], SYNOPSYS_UNCONNECTED__107}) );
  readCounters readCounter ( .clk(clk), .n_rst(n_rst), .executeRead(
        executeRead), .rowCount(rowCount), .colCount(colCount), .offsetCount(
        offsetCount), .cols_rollover_flag(cols_rollover_flag) );
  rgbToGray2 rgbToGray ( .clk(clk), .n_rst(n_rst), .inputData(inputData), 
        .grayPixel(grayPixel) );
  flex_counter flexCounterStore ( .clk(clk), .n_rst(n_rst), .clear(_0_net_), 
        .count_enable(grayReady), .colsFlag(cols_rollover_flag), 
        .rollover_val({numPixToLoad[3], 1'b0, numPixToLoad[1], 1'b1}), 
        .count_out(countOut), .rollover_flag(startSobel) );
  concat2 concat ( .clk(clk), .n_rst(n_rst), .pixel(grayPixel), .numPixToLoad(
        {numPixToLoad[3], 1'b0, numPixToLoad[1], 1'b1}), .count(countOut), 
        .grayReady(grayReady), .grayReady2(grayReady2), .matrix(matrix) );
  sobel sobel ( .clk(clk), .n_rst(n_rst), .data(matrix), .out(sobelData) );
  captureOutput2 captureOutput ( .clk(clk), .n_rst(n_rst), .holdIt(assertWrite), .sobelValue(sobelData), .out({SYNOPSYS_UNCONNECTED__108, 
        SYNOPSYS_UNCONNECTED__109, SYNOPSYS_UNCONNECTED__110, 
        SYNOPSYS_UNCONNECTED__111, SYNOPSYS_UNCONNECTED__112, 
        SYNOPSYS_UNCONNECTED__113, SYNOPSYS_UNCONNECTED__114, 
        SYNOPSYS_UNCONNECTED__115, SYNOPSYS_UNCONNECTED__116, 
        SYNOPSYS_UNCONNECTED__117, SYNOPSYS_UNCONNECTED__118, 
        SYNOPSYS_UNCONNECTED__119, SYNOPSYS_UNCONNECTED__120, 
        SYNOPSYS_UNCONNECTED__121, SYNOPSYS_UNCONNECTED__122, 
        SYNOPSYS_UNCONNECTED__123, SYNOPSYS_UNCONNECTED__124, 
        SYNOPSYS_UNCONNECTED__125, SYNOPSYS_UNCONNECTED__126, 
        SYNOPSYS_UNCONNECTED__127, SYNOPSYS_UNCONNECTED__128, 
        SYNOPSYS_UNCONNECTED__129, SYNOPSYS_UNCONNECTED__130, 
        SYNOPSYS_UNCONNECTED__131, outputData[7:0]}), .write({
        SYNOPSYS_UNCONNECTED__132, SYNOPSYS_UNCONNECTED__133, 
        SYNOPSYS_UNCONNECTED__134, SYNOPSYS_UNCONNECTED__135, 
        SYNOPSYS_UNCONNECTED__136, SYNOPSYS_UNCONNECTED__137, 
        SYNOPSYS_UNCONNECTED__138, SYNOPSYS_UNCONNECTED__139, 
        SYNOPSYS_UNCONNECTED__140, SYNOPSYS_UNCONNECTED__141, 
        SYNOPSYS_UNCONNECTED__142, SYNOPSYS_UNCONNECTED__143, 
        SYNOPSYS_UNCONNECTED__144, SYNOPSYS_UNCONNECTED__145, 
        SYNOPSYS_UNCONNECTED__146, SYNOPSYS_UNCONNECTED__147, 
        SYNOPSYS_UNCONNECTED__148, SYNOPSYS_UNCONNECTED__149, 
        SYNOPSYS_UNCONNECTED__150, SYNOPSYS_UNCONNECTED__151, 
        SYNOPSYS_UNCONNECTED__152, SYNOPSYS_UNCONNECTED__153, 
        SYNOPSYS_UNCONNECTED__154, SYNOPSYS_UNCONNECTED__155, 
        SYNOPSYS_UNCONNECTED__156, SYNOPSYS_UNCONNECTED__157, 
        SYNOPSYS_UNCONNECTED__158, SYNOPSYS_UNCONNECTED__159, 
        SYNOPSYS_UNCONNECTED__160, SYNOPSYS_UNCONNECTED__161, 
        SYNOPSYS_UNCONNECTED__162, writeEnableTempSignal[0]}) );
  OR2X1 U3 ( .A(cols_rollover_flag), .B(rwError[0]), .Y(_0_net_) );
endmodule

