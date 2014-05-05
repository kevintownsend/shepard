////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.87xd
//  \   \         Application: netgen
//  /   /         Filename: routed.v
// /___/   /\     Timestamp: Sun Apr  1 14:45:07 2012
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -ofmt verilog -sim -tm fifo_64x512_top -pcf mapped.pcf -w -sdf_anno false routed.ncd routed.v 
// Device	: 5vlx330ff1760-2 (PRODUCTION 1.73 2012-01-07)
// Input file	: routed.ncd
// Output file	: routed.v
// # of Modules	: 1
// Design Name	: fifo_64x512_top
// Xilinx        : /remote/Xilinx/13.4/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module fifo_64x512_top (
  CLK, RD_EN, EMPTY, WR_EN, FULL, PROG_FULL, SRST, DOUT, DIN
);
  input CLK;
  input RD_EN;
  output EMPTY;
  input WR_EN;
  output FULL;
  output PROG_FULL;
  input SRST;
  output [63 : 0] DOUT;
  input [63 : 0] DIN;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ;
  wire clk_i;
  wire DOUT_24_OBUF_1348;
  wire SRST_IBUF_1350;
  wire DOUT_32_OBUF_1352;
  wire DOUT_40_OBUF_1355;
  wire DOUT_17_OBUF_1358;
  wire DOUT_25_OBUF_1361;
  wire DOUT_33_OBUF_1364;
  wire DOUT_41_OBUF_1367;
  wire DOUT_18_OBUF_1370;
  wire DOUT_26_OBUF_1373;
  wire DOUT_34_OBUF_1376;
  wire DOUT_42_OBUF_1379;
  wire DOUT_50_OBUF_1382;
  wire DOUT_19_OBUF_1385;
  wire DOUT_27_OBUF_1388;
  wire DOUT_35_OBUF_1391;
  wire DOUT_43_OBUF_1394;
  wire DOUT_51_OBUF_1397;
  wire DOUT_28_OBUF_1400;
  wire DOUT_36_OBUF_1403;
  wire DOUT_44_OBUF_1406;
  wire DOUT_52_OBUF_1409;
  wire DOUT_60_OBUF_1412;
  wire DOUT_29_OBUF_1415;
  wire DOUT_37_OBUF_1418;
  wire DOUT_45_OBUF_1421;
  wire DOUT_53_OBUF_1424;
  wire DOUT_61_OBUF_1427;
  wire DOUT_38_OBUF_1430;
  wire DOUT_46_OBUF_1433;
  wire DOUT_54_OBUF_1436;
  wire DOUT_62_OBUF_1439;
  wire DOUT_39_OBUF_1442;
  wire DOUT_47_OBUF_1445;
  wire DOUT_55_OBUF_1448;
  wire DOUT_63_OBUF_1451;
  wire DOUT_48_OBUF_1454;
  wire DOUT_56_OBUF_1457;
  wire DOUT_49_OBUF_1460;
  wire DOUT_57_OBUF_1463;
  wire DOUT_58_OBUF_1466;
  wire DOUT_59_OBUF_1469;
  wire FULL_OBUF_1472;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_i_mux0000 ;
  wire RD_EN_IBUF_1475;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd2_1476 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1_1478 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/empty_fwft_i_mux0000 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/empty_fwft_fb_1481 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ;
  wire DOUT_0_OBUF_1502;
  wire DOUT_1_OBUF_1505;
  wire DOUT_2_OBUF_1508;
  wire DOUT_3_OBUF_1511;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/prog_full_i_and0001_1512 ;
  wire PROG_FULL_OBUF_1513;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/prog_full_i_and0000_1514 ;
  wire DOUT_4_OBUF_1515;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/rd_pntr_wr_inv_pad(0)_mand1_1516 ;
  wire WR_EN_IBUF_1517;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_fb_i_1518 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_1519 ;
  wire DOUT_5_OBUF_1520;
  wire DOUT_6_OBUF_1521;
  wire EMPTY_OBUF_1522;
  wire DOUT_7_OBUF_1523;
  wire DOUT_8_OBUF_1524;
  wire DOUT_9_OBUF_1525;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp1_0 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy[3] ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy[7] ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp0_0 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy[3] ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy[7] ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp1_0 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy[3] ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy[7] ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp0_0 ;
  wire DOUT_10_OBUF_1580;
  wire DOUT_11_OBUF_1581;
  wire DOUT_20_OBUF_1582;
  wire DOUT_12_OBUF_1583;
  wire DOUT_21_OBUF_1584;
  wire DOUT_13_OBUF_1585;
  wire DOUT_30_OBUF_1586;
  wire DOUT_22_OBUF_1587;
  wire DOUT_14_OBUF_1588;
  wire DOUT_31_OBUF_1589;
  wire DOUT_23_OBUF_1590;
  wire DOUT_15_OBUF_1591;
  wire DOUT_16_OBUF_1592;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/tmp_ram_rd_en ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_rd_en_i_1621 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_wr_en_i_1622 ;
  wire \fg0/N6 ;
  wire \fg0/N4 ;
  wire \fg0/N8 ;
  wire \DIN(21)/IBUF ;
  wire \DIN(13)/IBUF ;
  wire \DIN(30)/IBUF ;
  wire \DIN(22)/IBUF ;
  wire \DIN(14)/IBUF ;
  wire \DIN(31)/IBUF ;
  wire \DIN(23)/IBUF ;
  wire \DIN(15)/IBUF ;
  wire \DIN(40)/IBUF ;
  wire \DIN(32)/IBUF ;
  wire \DIN(24)/IBUF ;
  wire \DIN(16)/IBUF ;
  wire \DIN(41)/IBUF ;
  wire \DIN(33)/IBUF ;
  wire \DIN(25)/IBUF ;
  wire \DIN(17)/IBUF ;
  wire \DIN(50)/IBUF ;
  wire \DIN(42)/IBUF ;
  wire \DIN(34)/IBUF ;
  wire \DIN(26)/IBUF ;
  wire \DIN(18)/IBUF ;
  wire \DIN(51)/IBUF ;
  wire \DIN(43)/IBUF ;
  wire \DIN(35)/IBUF ;
  wire \DIN(27)/IBUF ;
  wire \DIN(19)/IBUF ;
  wire \DIN(60)/IBUF ;
  wire \DIN(52)/IBUF ;
  wire \DIN(44)/IBUF ;
  wire \DIN(36)/IBUF ;
  wire \DIN(28)/IBUF ;
  wire \DIN(61)/IBUF ;
  wire \DIN(53)/IBUF ;
  wire \DIN(45)/IBUF ;
  wire \DIN(37)/IBUF ;
  wire \DIN(29)/IBUF ;
  wire \DIN(62)/IBUF ;
  wire \DIN(54)/IBUF ;
  wire \DIN(46)/IBUF ;
  wire \DIN(38)/IBUF ;
  wire \DIN(63)/IBUF ;
  wire \DIN(55)/IBUF ;
  wire \DIN(47)/IBUF ;
  wire \DIN(39)/IBUF ;
  wire \DIN(56)/IBUF ;
  wire \DIN(48)/IBUF ;
  wire \DIN(57)/IBUF ;
  wire \DIN(49)/IBUF ;
  wire \DIN(58)/IBUF ;
  wire \DIN(59)/IBUF ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(1)_rt_138 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(2)_rt_134 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(3)_rt_122 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(4)_rt_171 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(5)_rt_167 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(6)_rt_163 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(7)_rt_151 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(8)_rt_184 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp0 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp1 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(1)_rt_314 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(2)_rt_310 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(3)_rt_298 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(4)_rt_347 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(5)_rt_343 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(6)_rt_339 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(7)_rt_327 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(8)_rt_360 ;
  wire \CLK/IBUF ;
  wire \SRST/IBUF ;
  wire \RD_EN/IBUF ;
  wire \WR_EN/IBUF ;
  wire \DIN(0)/IBUF ;
  wire \DIN(1)/IBUF ;
  wire \DIN(2)/IBUF ;
  wire \DIN(3)/IBUF ;
  wire \DIN(4)/IBUF ;
  wire \DIN(5)/IBUF ;
  wire \DIN(6)/IBUF ;
  wire \DIN(7)/IBUF ;
  wire \DIN(8)/IBUF ;
  wire \DIN(9)/IBUF ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY0 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY1 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY2 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY3 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY4 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY5 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY6 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY7 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP0 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP1 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP2 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP3 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP4 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP5 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP6 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP7 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DBITERR ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/SBITERR ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU0 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU1 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU2 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU3 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU4 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU5 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL0 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL1 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL2 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL3 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL4 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL5 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU0 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU1 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU2 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU3 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU4 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU5 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL0 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL1 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL2 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL3 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL4 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL5 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDRCLKL_INTNOT ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDRCLKU_INTNOT ;
  wire \DIN(10)/IBUF ;
  wire \DIN(11)/IBUF ;
  wire \DIN(20)/IBUF ;
  wire \DIN(12)/IBUF ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1-In ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp1 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_mux0000_1045 ;
  wire \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp0 ;
  wire GND;
  wire \NLW_fg0/N0_5.SLICEL_D5LUT_O_UNCONNECTED ;
  wire \NLW_ProtoComp12.CYINITGND_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(3)_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(3)_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(3)_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/N0_6.SLICEL_C5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_7.SLICEL_B5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N1.SLICEL_A5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0.SLICEL_D5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(7)_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(7)_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(7)_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/N0_2.SLICEL_C5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_3.SLICEL_B5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_4.SLICEL_A5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_CO[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_DI[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_DI[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_DI[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_DI[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_O[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_O[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_O[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_S[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_S[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_S[3]_UNCONNECTED ;
  wire \NLW_fg0/N0_33.SLICEL_D5LUT_O_UNCONNECTED ;
  wire \NLW_ProtoComp10.CYINITVCC.1_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_O[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_O[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_O[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_O[3]_UNCONNECTED ;
  wire \NLW_fg0/N0_34.SLICEL_C5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_35.SLICEL_B5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_36.SLICEL_A5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_CO[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_DI[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_DI[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_DI[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_O[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_O[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_O[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_O[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_S[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_S[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_S[3]_UNCONNECTED ;
  wire \NLW_fg0/N0_32.SLICEL_A5LUT_O_UNCONNECTED ;
  wire VCC;
  wire \NLW_ProtoComp15.CYINITGND_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(3)_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(3)_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(3)_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(3)_O[0]_UNCONNECTED ;
  wire \NLW_fg0/N0_20.SLICEL_A6LUT_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(7)_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(7)_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(7)_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_CO[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_DI[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_DI[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_DI[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_O[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_O[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_S[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_S[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_CO[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_DI[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_DI[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_DI[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_O[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_O[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_O[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_O[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_S[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_S[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_S[3]_UNCONNECTED ;
  wire \NLW_fg0/N0_37.SLICEL_A5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_14.SLICEL_D5LUT_O_UNCONNECTED ;
  wire \NLW_ProtoComp12.CYINITGND.1_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(3)_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(3)_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(3)_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/N0_15.SLICEL_C5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_16.SLICEL_B5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N1_2.SLICEL_A5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_10.SLICEL_D5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(7)_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(7)_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(7)_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/N0_11.SLICEL_C5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_12.SLICEL_B5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_13.SLICEL_A5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_CO[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_DI[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_DI[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_DI[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_DI[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_O[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_O[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_O[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_S[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_S[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_S[3]_UNCONNECTED ;
  wire \NLW_fg0/N0_21.SLICEL_D6LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_28.SLICEL_D5LUT_O_UNCONNECTED ;
  wire \NLW_ProtoComp42.CYINITVCC_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_O[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_O[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_O[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_O[3]_UNCONNECTED ;
  wire \NLW_fg0/N0_29.SLICEL_C5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_30.SLICEL_B5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_31.SLICEL_A5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_CO[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_DI[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_DI[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_DI[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_O[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_O[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_O[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_O[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_S[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_S[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_S[3]_UNCONNECTED ;
  wire \NLW_fg0/N0_27.SLICEL_A5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_23.SLICEL_D5LUT_O_UNCONNECTED ;
  wire \NLW_ProtoComp45.CYINITVCC_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_O[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_O[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_O[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_O[3]_UNCONNECTED ;
  wire \NLW_fg0/N0_24.SLICEL_C5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_25.SLICEL_B5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_26.SLICEL_A5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_CO[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_DI[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_DI[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_DI[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_O[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_O[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_O[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_O[3]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_S[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_S[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_S[3]_UNCONNECTED ;
  wire \NLW_fg0/N0_22.SLICEL_A5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_38.SLICEL_D5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1(7)/ProtoComp42.CYINITVCC_O_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_CO[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_CO[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_CO[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_O[0]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_O[1]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_O[2]_UNCONNECTED ;
  wire \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_O[3]_UNCONNECTED ;
  wire \NLW_fg0/N0_39.SLICEL_C5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_40.SLICEL_B5LUT_O_UNCONNECTED ;
  wire \NLW_fg0/N0_41.SLICEL_A5LUT_O_UNCONNECTED ;
  wire [63 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem ;
  wire [8 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 ;
  wire [8 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count ;
  wire [8 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 ;
  wire [8 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count ;
  wire [3 : 3] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/carrynet ;
  wire [3 : 3] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/carrynet ;
  wire [9 : 1] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad ;
  wire [3 : 3] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/carrynet ;
  wire [3 : 3] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/carrynet ;
  wire [0 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_lut ;
  wire [8 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result ;
  wire [4 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1 ;
  wire [9 : 1] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut ;
  wire [9 : 1] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 ;
  wire [4 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1 ;
  wire [0 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_lut ;
  wire [8 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result ;
  wire [4 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1 ;
  wire [4 : 0] \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1 ;
  X_IPAD #(
    .LOC ( "IOB_X0Y254" ))
  \DIN(21)/PAD  (
    .PAD(DIN[21])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y254" ))
  DIN_21_IBUF (
    .I(DIN[21]),
    .O(\DIN(21)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y262" ))
  \DIN(13)/PAD  (
    .PAD(DIN[13])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y262" ))
  DIN_13_IBUF (
    .I(DIN[13]),
    .O(\DIN(13)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y245" ))
  \DIN(30)/PAD  (
    .PAD(DIN[30])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y245" ))
  DIN_30_IBUF (
    .I(DIN[30]),
    .O(\DIN(30)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y253" ))
  \DIN(22)/PAD  (
    .PAD(DIN[22])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y253" ))
  DIN_22_IBUF (
    .I(DIN[22]),
    .O(\DIN(22)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y261" ))
  \DIN(14)/PAD  (
    .PAD(DIN[14])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y261" ))
  DIN_14_IBUF (
    .I(DIN[14]),
    .O(\DIN(14)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y244" ))
  \DIN(31)/PAD  (
    .PAD(DIN[31])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y244" ))
  DIN_31_IBUF (
    .I(DIN[31]),
    .O(\DIN(31)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y276" ))
  \DIN(23)/PAD  (
    .PAD(DIN[23])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y276" ))
  DIN_23_IBUF (
    .I(DIN[23]),
    .O(\DIN(23)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y260" ))
  \DIN(15)/PAD  (
    .PAD(DIN[15])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y260" ))
  DIN_15_IBUF (
    .I(DIN[15]),
    .O(\DIN(15)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y325" ))
  \DIN(40)/PAD  (
    .PAD(DIN[40])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y325" ))
  DIN_40_IBUF (
    .I(DIN[40]),
    .O(\DIN(40)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y243" ))
  \DIN(32)/PAD  (
    .PAD(DIN[32])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y243" ))
  DIN_32_IBUF (
    .I(DIN[32]),
    .O(\DIN(32)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y251" ))
  \DIN(24)/PAD  (
    .PAD(DIN[24])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y251" ))
  DIN_24_IBUF (
    .I(DIN[24]),
    .O(\DIN(24)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y259" ))
  \DIN(16)/PAD  (
    .PAD(DIN[16])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y259" ))
  DIN_16_IBUF (
    .I(DIN[16]),
    .O(\DIN(16)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y320" ))
  \DIN(41)/PAD  (
    .PAD(DIN[41])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y320" ))
  DIN_41_IBUF (
    .I(DIN[41]),
    .O(\DIN(41)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y242" ))
  \DIN(33)/PAD  (
    .PAD(DIN[33])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y242" ))
  DIN_33_IBUF (
    .I(DIN[33]),
    .O(\DIN(33)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y302" ))
  \DIN(25)/PAD  (
    .PAD(DIN[25])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y302" ))
  DIN_25_IBUF (
    .I(DIN[25]),
    .O(\DIN(25)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y258" ))
  \DIN(17)/PAD  (
    .PAD(DIN[17])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y258" ))
  DIN_17_IBUF (
    .I(DIN[17]),
    .O(\DIN(17)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y323" ))
  \DIN(50)/PAD  (
    .PAD(DIN[50])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y323" ))
  DIN_50_IBUF (
    .I(DIN[50]),
    .O(\DIN(50)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y220" ))
  \DIN(42)/PAD  (
    .PAD(DIN[42])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y220" ))
  DIN_42_IBUF (
    .I(DIN[42]),
    .O(\DIN(42)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y241" ))
  \DIN(34)/PAD  (
    .PAD(DIN[34])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y241" ))
  DIN_34_IBUF (
    .I(DIN[34]),
    .O(\DIN(34)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y249" ))
  \DIN(26)/PAD  (
    .PAD(DIN[26])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y249" ))
  DIN_26_IBUF (
    .I(DIN[26]),
    .O(\DIN(26)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y257" ))
  \DIN(18)/PAD  (
    .PAD(DIN[18])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y257" ))
  DIN_18_IBUF (
    .I(DIN[18]),
    .O(\DIN(18)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y206" ))
  \DIN(51)/PAD  (
    .PAD(DIN[51])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y206" ))
  DIN_51_IBUF (
    .I(DIN[51]),
    .O(\DIN(51)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y329" ))
  \DIN(43)/PAD  (
    .PAD(DIN[43])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y329" ))
  DIN_43_IBUF (
    .I(DIN[43]),
    .O(\DIN(43)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y299" ))
  \DIN(35)/PAD  (
    .PAD(DIN[35])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y299" ))
  DIN_35_IBUF (
    .I(DIN[35]),
    .O(\DIN(35)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y248" ))
  \DIN(27)/PAD  (
    .PAD(DIN[27])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y248" ))
  DIN_27_IBUF (
    .I(DIN[27]),
    .O(\DIN(27)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y300" ))
  \DIN(19)/PAD  (
    .PAD(DIN[19])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y300" ))
  DIN_19_IBUF (
    .I(DIN[19]),
    .O(\DIN(19)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y278" ))
  \DIN(60)/PAD  (
    .PAD(DIN[60])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y278" ))
  DIN_60_IBUF (
    .I(DIN[60]),
    .O(\DIN(60)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y203" ))
  \DIN(52)/PAD  (
    .PAD(DIN[52])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y203" ))
  DIN_52_IBUF (
    .I(DIN[52]),
    .O(\DIN(52)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y224" ))
  \DIN(44)/PAD  (
    .PAD(DIN[44])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y224" ))
  DIN_44_IBUF (
    .I(DIN[44]),
    .O(\DIN(44)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y228" ))
  \DIN(36)/PAD  (
    .PAD(DIN[36])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y228" ))
  DIN_36_IBUF (
    .I(DIN[36]),
    .O(\DIN(36)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y247" ))
  \DIN(28)/PAD  (
    .PAD(DIN[28])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y247" ))
  DIN_28_IBUF (
    .I(DIN[28]),
    .O(\DIN(28)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y234" ))
  \DIN(61)/PAD  (
    .PAD(DIN[61])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y234" ))
  DIN_61_IBUF (
    .I(DIN[61]),
    .O(\DIN(61)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y213" ))
  \DIN(53)/PAD  (
    .PAD(DIN[53])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y213" ))
  DIN_53_IBUF (
    .I(DIN[53]),
    .O(\DIN(53)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y321" ))
  \DIN(45)/PAD  (
    .PAD(DIN[45])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y321" ))
  DIN_45_IBUF (
    .I(DIN[45]),
    .O(\DIN(45)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y322" ))
  \DIN(37)/PAD  (
    .PAD(DIN[37])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y322" ))
  DIN_37_IBUF (
    .I(DIN[37]),
    .O(\DIN(37)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y293" ))
  \DIN(29)/PAD  (
    .PAD(DIN[29])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y293" ))
  DIN_29_IBUF (
    .I(DIN[29]),
    .O(\DIN(29)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y233" ))
  \DIN(62)/PAD  (
    .PAD(DIN[62])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y233" ))
  DIN_62_IBUF (
    .I(DIN[62]),
    .O(\DIN(62)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y205" ))
  \DIN(54)/PAD  (
    .PAD(DIN[54])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y205" ))
  DIN_54_IBUF (
    .I(DIN[54]),
    .O(\DIN(54)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y222" ))
  \DIN(46)/PAD  (
    .PAD(DIN[46])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y222" ))
  DIN_46_IBUF (
    .I(DIN[46]),
    .O(\DIN(46)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y221" ))
  \DIN(38)/PAD  (
    .PAD(DIN[38])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y221" ))
  DIN_38_IBUF (
    .I(DIN[38]),
    .O(\DIN(38)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y232" ))
  \DIN(63)/PAD  (
    .PAD(DIN[63])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y232" ))
  DIN_63_IBUF (
    .I(DIN[63]),
    .O(\DIN(63)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y212" ))
  \DIN(55)/PAD  (
    .PAD(DIN[55])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y212" ))
  DIN_55_IBUF (
    .I(DIN[55]),
    .O(\DIN(55)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y223" ))
  \DIN(47)/PAD  (
    .PAD(DIN[47])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y223" ))
  DIN_47_IBUF (
    .I(DIN[47]),
    .O(\DIN(47)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y326" ))
  \DIN(39)/PAD  (
    .PAD(DIN[39])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y326" ))
  DIN_39_IBUF (
    .I(DIN[39]),
    .O(\DIN(39)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y239" ))
  \DIN(56)/PAD  (
    .PAD(DIN[56])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y239" ))
  DIN_56_IBUF (
    .I(DIN[56]),
    .O(\DIN(56)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y214" ))
  \DIN(48)/PAD  (
    .PAD(DIN[48])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y214" ))
  DIN_48_IBUF (
    .I(DIN[48]),
    .O(\DIN(48)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y238" ))
  \DIN(57)/PAD  (
    .PAD(DIN[57])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y238" ))
  DIN_57_IBUF (
    .I(DIN[57]),
    .O(\DIN(57)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y279" ))
  \DIN(49)/PAD  (
    .PAD(DIN[49])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y279" ))
  DIN_49_IBUF (
    .I(DIN[49]),
    .O(\DIN(49)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y237" ))
  \DIN(58)/PAD  (
    .PAD(DIN[58])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y237" ))
  DIN_58_IBUF (
    .I(DIN[58]),
    .O(\DIN(58)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y236" ))
  \DIN(59)/PAD  (
    .PAD(DIN[59])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y236" ))
  DIN_59_IBUF (
    .I(DIN[59]),
    .O(\DIN(59)/IBUF )
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y296" ))
  \DOUT(0)/PAD  (
    .PAD(DOUT[0])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y296" ))
  DOUT_0_OBUF (
    .I(DOUT_0_OBUF_1502),
    .O(DOUT[0])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y333" ))
  \DOUT(1)/PAD  (
    .PAD(DOUT[1])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y333" ))
  DOUT_1_OBUF (
    .I(DOUT_1_OBUF_1505),
    .O(DOUT[1])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y331" ))
  \DOUT(2)/PAD  (
    .PAD(DOUT[2])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y331" ))
  DOUT_2_OBUF (
    .I(DOUT_2_OBUF_1508),
    .O(DOUT[2])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y219" ))
  \DOUT(3)/PAD  (
    .PAD(DOUT[3])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y219" ))
  DOUT_3_OBUF (
    .I(DOUT_3_OBUF_1511),
    .O(DOUT[3])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y269" ))
  \DOUT(4)/PAD  (
    .PAD(DOUT[4])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y269" ))
  DOUT_4_OBUF (
    .I(DOUT_4_OBUF_1515),
    .O(DOUT[4])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y293" ))
  \DOUT(5)/PAD  (
    .PAD(DOUT[5])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y293" ))
  DOUT_5_OBUF (
    .I(DOUT_5_OBUF_1520),
    .O(DOUT[5])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y287" ))
  \DOUT(6)/PAD  (
    .PAD(DOUT[6])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y287" ))
  DOUT_6_OBUF (
    .I(DOUT_6_OBUF_1521),
    .O(DOUT[6])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y292" ))
  \DOUT(7)/PAD  (
    .PAD(DOUT[7])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y292" ))
  DOUT_7_OBUF (
    .I(DOUT_7_OBUF_1523),
    .O(DOUT[7])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y286" ))
  \DOUT(8)/PAD  (
    .PAD(DOUT[8])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y286" ))
  DOUT_8_OBUF (
    .I(DOUT_8_OBUF_1524),
    .O(DOUT[8])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y290" ))
  \DOUT(9)/PAD  (
    .PAD(DOUT[9])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y290" ))
  DOUT_9_OBUF (
    .I(DOUT_9_OBUF_1525),
    .O(DOUT[9])
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_3  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [3]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [3]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(3)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [3]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(3)_rt_122 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_5.SLICEL_D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_5.SLICEL_D5LUT_O_UNCONNECTED )
  );
  X_ZERO #(
    .LOC ( "SLICE_X32Y137" ))
  \ProtoComp12.CYINITGND  (
    .O(\NLW_ProtoComp12.CYINITGND_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_2  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [2]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [2]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X32Y137" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(3)  (
    .CI(1'b0),
    .CYINIT(1'b0),
    .CO({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy[3] , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(3)_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(3)_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(3)_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b1}),
    .O({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [0]}),
    .S({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(3)_rt_122 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(2)_rt_134 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(1)_rt_138 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_lut [0]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(2)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [2]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(2)_rt_134 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_6.SLICEL_C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_6.SLICEL_C5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_1  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [1]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [1]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(1)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [1]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(1)_rt_138 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_7.SLICEL_B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_7.SLICEL_B5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 1'b1 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_0  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [0]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [0]),
    .SRST(GND),
    .SSET(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 64'h00FF00FF00FF00FF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_lut(0)_INV_0  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [0]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_lut [0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y137" ),
    .INIT ( 32'hFFFFFFFF ))
  \fg0/N1.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N1.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_7  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [7]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [7]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(7)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [7]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(7)_rt_151 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0.SLICEL_D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0.SLICEL_D5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_6  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [6]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [6]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X32Y138" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(7)  (
    .CI(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy[3] ),
    .CYINIT(1'b0),
    .CO({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy[7] , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(7)_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(7)_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy(7)_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [7], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [6], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [5], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [4]}),
    .S({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(7)_rt_151 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(6)_rt_163 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(5)_rt_167 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(4)_rt_171 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(6)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [6]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(6)_rt_163 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_2.SLICEL_C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_2.SLICEL_C5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_5  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [5]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [5]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(5)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [5]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(5)_rt_167 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_3.SLICEL_B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_3.SLICEL_B5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_4  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [4]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [4]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(4)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [4]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(4)_rt_171 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y138" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_4.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_4.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X32Y139" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)  (
    .CI(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_cy[7] ),
    .CYINIT(1'b0),
    .CO({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_CO[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_CO[0]_UNCONNECTED }),
    .DI({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_DI[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_DI[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_DI[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_DI[0]_UNCONNECTED }),
    .O({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_O[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_O[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_O[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [8]}),
    .S({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_S[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_S[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Mcount_count_xor(8)_S[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(8)_rt_184 })
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y139" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_8  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/Result [8]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [8]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y139" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(8)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [8]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count(8)_rt_184 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X34Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1_3_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [7]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [7]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [6]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [6]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1 [3])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X34Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_33.SLICEL_D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_33.SLICEL_D5LUT_O_UNCONNECTED )
  );
  X_ONE #(
    .LOC ( "SLICE_X34Y135" ))
  \ProtoComp10.CYINITVCC.1  (
    .O(\NLW_ProtoComp10.CYINITVCC.1_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X34Y135" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms  (
    .CI(1'b0),
    .CYINIT(1'b1),
    .CO({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/carrynet [3], 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_O[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_O[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_O[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms_O[0]_UNCONNECTED }),
    .S({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1 [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1 [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1 [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1 [0]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X34Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1_2_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [5]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [5]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [4]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [4]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1 [2])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X34Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_34.SLICEL_C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_34.SLICEL_C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X34Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1_1_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [3]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [3]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [2]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [2]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1 [1])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X34Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_35.SLICEL_B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_35.SLICEL_B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X34Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1_0_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [1]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [1]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [0]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [0]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1 [0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X34Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_36.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_36.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_BUF 
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp0/fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp0_AMUX_Delay  (
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp0 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp0_0 )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X34Y136" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms  (
    .CI(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/carrynet [3]),
    .CYINIT(1'b0),
    .CO({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_CO[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_CO[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp0 }),
    .DI({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_DI[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_DI[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_DI[1]_UNCONNECTED , 1'b0}),
    .O({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_O[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_O[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_O[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_O[0]_UNCONNECTED }),
    .S({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_S[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_S[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms_S[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1 [4]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X34Y136" ),
    .INIT ( 64'hFF0000FFFF0000FF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1_4_not00001  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [8]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [8]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c1/v1 [4])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X34Y136" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_32.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_32.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X28Y131" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_3  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [3]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [3]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y131" ),
    .INIT ( 64'hFFFF00000000FFFF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut(3)  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [2]),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [2]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [3])
  );
  X_ZERO #(
    .LOC ( "SLICE_X28Y131" ))
  \ProtoComp15.CYINITGND  (
    .O(\NLW_ProtoComp15.CYINITGND_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X28Y131" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_2  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [2]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [2]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X28Y131" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(3)  (
    .CI(1'b0),
    .CYINIT(1'b0),
    .CO({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy[3] , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(3)_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(3)_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(3)_CO[0]_UNCONNECTED }),
    .DI({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [0], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/rd_pntr_wr_inv_pad(0)_mand1_1516 }),
    .O({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [1], 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(3)_O[0]_UNCONNECTED }),
    .S({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [1], 1'b0})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y131" ),
    .INIT ( 64'hFFFF00000000FFFF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut(2)  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [1]),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [1]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [2])
  );
  X_SFF #(
    .LOC ( "SLICE_X28Y131" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_1  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [1]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [1]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y131" ),
    .INIT ( 64'hFFFF00000000FFFF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut(1)  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [0]),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [0]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [1])
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y131" ),
    .INIT ( 64'h0000000000000000 ))
  \fg0/N0_20.SLICEL_A6LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\NLW_fg0/N0_20.SLICEL_A6LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X28Y132" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_7  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [7]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [7]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y132" ),
    .INIT ( 64'hFFFF00000000FFFF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut(7)  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [6]),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [6]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [7])
  );
  X_SFF #(
    .LOC ( "SLICE_X28Y132" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_6  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [6]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [6]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X28Y132" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(7)  (
    .CI(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy[3] ),
    .CYINIT(1'b0),
    .CO({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy[7] , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(7)_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(7)_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy(7)_CO[0]_UNCONNECTED }),
    .DI({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [6], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [5], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [4], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [3]}),
    .O({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [7], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [6], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [5], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [4]}),
    .S({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [7], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [6], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [5], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [4]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y132" ),
    .INIT ( 64'hFFFF00000000FFFF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut(6)  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [5]),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [5]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [6])
  );
  X_SFF #(
    .LOC ( "SLICE_X28Y132" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_5  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [5]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [5]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y132" ),
    .INIT ( 64'hFFFF00000000FFFF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut(5)  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [4]),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [4]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [5])
  );
  X_SFF #(
    .LOC ( "SLICE_X28Y132" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_4  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [4]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [4]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y132" ),
    .INIT ( 64'hFFFF00000000FFFF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut(4)  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [3]),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [3]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [4])
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X28Y133" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)  (
    .CI(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy[7] ),
    .CYINIT(1'b0),
    .CO({
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_CO[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_CO[0]_UNCONNECTED }),
    .DI({
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_DI[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_DI[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_DI[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [7]}),
    .O({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_O[3]_UNCONNECTED 
, \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_O[2]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [9], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [8]}),
    .S({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_S[3]_UNCONNECTED 
, \NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor(9)_S[2]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [9], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [8]})
  );
  X_SFF #(
    .LOC ( "SLICE_X28Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_9  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [9]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [9]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y133" ),
    .INIT ( 64'hFFFF00000000FFFF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut(9)  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [8]),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [8]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [9])
  );
  X_SFF #(
    .LOC ( "SLICE_X28Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_8  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad_add0000 [8]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [8]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y133" ),
    .INIT ( 64'hFFFF00000000FFFF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut(8)  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [7]),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [7]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [8])
  );
  X_BUF 
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp1/fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp1_AMUX_Delay  (
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp1 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp1_0 )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X33Y136" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms  (
    .CI(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/carrynet [3]),
    .CYINIT(1'b0),
    .CO({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_CO[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_CO[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp1 }),
    .DI({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_DI[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_DI[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_DI[1]_UNCONNECTED , 1'b0}),
    .O({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_O[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_O[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_O[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_O[0]_UNCONNECTED }),
    .S({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_S[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_S[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms_S[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1 [4]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X33Y136" ),
    .INIT ( 64'hFF0000FFFF0000FF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1_4_not00001  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [8]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [8]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1 [4])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X33Y136" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_37.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_37.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_3  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [3]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [3]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(3)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [3]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(3)_rt_298 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_14.SLICEL_D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_14.SLICEL_D5LUT_O_UNCONNECTED )
  );
  X_ZERO #(
    .LOC ( "SLICE_X30Y133" ))
  \ProtoComp12.CYINITGND.1  (
    .O(\NLW_ProtoComp12.CYINITGND.1_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_2  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [2]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [2]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X30Y133" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(3)  (
    .CI(1'b0),
    .CYINIT(1'b0),
    .CO({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy[3] , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(3)_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(3)_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(3)_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b1}),
    .O({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [0]}),
    .S({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(3)_rt_298 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(2)_rt_310 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(1)_rt_314 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_lut [0]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(2)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [2]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(2)_rt_310 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_15.SLICEL_C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_15.SLICEL_C5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_1  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [1]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [1]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(1)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [1]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(1)_rt_314 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_16.SLICEL_B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_16.SLICEL_B5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 1'b1 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_0  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [0]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [0]),
    .SRST(GND),
    .SSET(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 64'h00FF00FF00FF00FF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_lut(0)_INV_0  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [0]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_lut [0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X30Y133" ),
    .INIT ( 32'hFFFFFFFF ))
  \fg0/N1_2.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N1_2.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_7  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [7]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [7]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(7)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [7]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(7)_rt_327 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_10.SLICEL_D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_10.SLICEL_D5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_6  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [6]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [6]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X30Y134" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(7)  (
    .CI(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy[3] ),
    .CYINIT(1'b0),
    .CO({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy[7] , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(7)_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(7)_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy(7)_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [7], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [6], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [5], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [4]}),
    .S({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(7)_rt_327 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(6)_rt_339 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(5)_rt_343 , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(4)_rt_347 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(6)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [6]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(6)_rt_339 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_11.SLICEL_C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_11.SLICEL_C5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_5  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [5]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [5]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(5)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [5]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(5)_rt_343 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_12.SLICEL_B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_12.SLICEL_B5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_4  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [4]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [4]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(4)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [4]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(4)_rt_347 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X30Y134" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_13.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_13.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X30Y135" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)  (
    .CI(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_cy[7] ),
    .CYINIT(1'b0),
    .CO({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_CO[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_CO[0]_UNCONNECTED }),
    .DI({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_DI[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_DI[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_DI[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_DI[0]_UNCONNECTED }),
    .O({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_O[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_O[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_O[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [8]}),
    .S({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_S[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_S[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Mcount_count_xor(8)_S[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(8)_rt_360 })
  );
  X_SFF #(
    .LOC ( "SLICE_X30Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_8  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/Result [8]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [8]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X30Y135" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(8)_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [8]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count(8)_rt_360 )
  );
  X_IPAD #(
    .LOC ( "IOB_X1Y181" ))
  \CLK/PAD  (
    .PAD(CLK)
  );
  X_BUF #(
    .LOC ( "IOB_X1Y181" ))
  CLK_IBUFG (
    .I(CLK),
    .O(\CLK/IBUF )
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y230" ))
  \PROG_FULL/PAD  (
    .PAD(PROG_FULL)
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y230" ))
  PROG_FULL_OBUF (
    .I(PROG_FULL_OBUF_1513),
    .O(PROG_FULL)
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y227" ))
  \FULL/PAD  (
    .PAD(FULL)
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y227" ))
  FULL_OBUF (
    .I(FULL_OBUF_1472),
    .O(FULL)
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y229" ))
  \SRST/PAD  (
    .PAD(SRST)
  );
  X_BUF #(
    .LOC ( "IOB_X0Y229" ))
  \SRST/IMUX  (
    .I(\SRST/IBUF ),
    .O(SRST_IBUF_1350)
  );
  X_BUF #(
    .LOC ( "IOB_X0Y229" ))
  SRST_IBUF (
    .I(SRST),
    .O(\SRST/IBUF )
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y226" ))
  \EMPTY/PAD  (
    .PAD(EMPTY)
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y226" ))
  EMPTY_OBUF (
    .I(EMPTY_OBUF_1522),
    .O(EMPTY)
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y231" ))
  \RD_EN/PAD  (
    .PAD(RD_EN)
  );
  X_BUF #(
    .LOC ( "IOB_X0Y231" ))
  \RD_EN/IMUX  (
    .I(\RD_EN/IBUF ),
    .O(RD_EN_IBUF_1475)
  );
  X_BUF #(
    .LOC ( "IOB_X0Y231" ))
  RD_EN_IBUF (
    .I(RD_EN),
    .O(\RD_EN/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X1Y278" ))
  \WR_EN/PAD  (
    .PAD(WR_EN)
  );
  X_BUF #(
    .LOC ( "IOB_X1Y278" ))
  \WR_EN/IMUX  (
    .I(\WR_EN/IBUF ),
    .O(WR_EN_IBUF_1517)
  );
  X_BUF #(
    .LOC ( "IOB_X1Y278" ))
  WR_EN_IBUF (
    .I(WR_EN),
    .O(\WR_EN/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y275" ))
  \DIN(0)/PAD  (
    .PAD(DIN[0])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y275" ))
  DIN_0_IBUF (
    .I(DIN[0]),
    .O(\DIN(0)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y274" ))
  \DIN(1)/PAD  (
    .PAD(DIN[1])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y274" ))
  DIN_1_IBUF (
    .I(DIN[1]),
    .O(\DIN(1)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y273" ))
  \DIN(2)/PAD  (
    .PAD(DIN[2])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y273" ))
  DIN_2_IBUF (
    .I(DIN[2]),
    .O(\DIN(2)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y272" ))
  \DIN(3)/PAD  (
    .PAD(DIN[3])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y272" ))
  DIN_3_IBUF (
    .I(DIN[3]),
    .O(\DIN(3)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y271" ))
  \DIN(4)/PAD  (
    .PAD(DIN[4])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y271" ))
  DIN_4_IBUF (
    .I(DIN[4]),
    .O(\DIN(4)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y306" ))
  \DIN(5)/PAD  (
    .PAD(DIN[5])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y306" ))
  DIN_5_IBUF (
    .I(DIN[5]),
    .O(\DIN(5)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y269" ))
  \DIN(6)/PAD  (
    .PAD(DIN[6])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y269" ))
  DIN_6_IBUF (
    .I(DIN[6]),
    .O(\DIN(6)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y277" ))
  \DIN(7)/PAD  (
    .PAD(DIN[7])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y277" ))
  DIN_7_IBUF (
    .I(DIN[7]),
    .O(\DIN(7)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y303" ))
  \DIN(8)/PAD  (
    .PAD(DIN[8])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y303" ))
  DIN_8_IBUF (
    .I(DIN[8]),
    .O(\DIN(8)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y304" ))
  \DIN(9)/PAD  (
    .PAD(DIN[9])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y304" ))
  DIN_9_IBUF (
    .I(DIN[9]),
    .O(\DIN(9)/IBUF )
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y289" ))
  \DOUT(10)/PAD  (
    .PAD(DOUT[10])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y289" ))
  DOUT_10_OBUF (
    .I(DOUT_10_OBUF_1580),
    .O(DOUT[10])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y288" ))
  \DOUT(11)/PAD  (
    .PAD(DOUT[11])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y288" ))
  DOUT_11_OBUF (
    .I(DOUT_11_OBUF_1581),
    .O(DOUT[11])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y319" ))
  \DOUT(20)/PAD  (
    .PAD(DOUT[20])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y319" ))
  DOUT_20_OBUF (
    .I(DOUT_20_OBUF_1582),
    .O(DOUT[20])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y291" ))
  \DOUT(12)/PAD  (
    .PAD(DOUT[12])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y291" ))
  DOUT_12_OBUF (
    .I(DOUT_12_OBUF_1583),
    .O(DOUT[12])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y318" ))
  \DOUT(21)/PAD  (
    .PAD(DOUT[21])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y318" ))
  DOUT_21_OBUF (
    .I(DOUT_21_OBUF_1584),
    .O(DOUT[21])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y330" ))
  \DOUT(13)/PAD  (
    .PAD(DOUT[13])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y330" ))
  DOUT_13_OBUF (
    .I(DOUT_13_OBUF_1585),
    .O(DOUT[13])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y309" ))
  \DOUT(30)/PAD  (
    .PAD(DOUT[30])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y309" ))
  DOUT_30_OBUF (
    .I(DOUT_30_OBUF_1586),
    .O(DOUT[30])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y317" ))
  \DOUT(22)/PAD  (
    .PAD(DOUT[22])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y317" ))
  DOUT_22_OBUF (
    .I(DOUT_22_OBUF_1587),
    .O(DOUT[22])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y285" ))
  \DOUT(14)/PAD  (
    .PAD(DOUT[14])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y285" ))
  DOUT_14_OBUF (
    .I(DOUT_14_OBUF_1588),
    .O(DOUT[14])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y308" ))
  \DOUT(31)/PAD  (
    .PAD(DOUT[31])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y308" ))
  DOUT_31_OBUF (
    .I(DOUT_31_OBUF_1589),
    .O(DOUT[31])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y316" ))
  \DOUT(23)/PAD  (
    .PAD(DOUT[23])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y316" ))
  DOUT_23_OBUF (
    .I(DOUT_23_OBUF_1590),
    .O(DOUT[23])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y284" ))
  \DOUT(15)/PAD  (
    .PAD(DOUT[15])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y284" ))
  DOUT_15_OBUF (
    .I(DOUT_15_OBUF_1591),
    .O(DOUT[15])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y240" ))
  \DOUT(40)/PAD  (
    .PAD(DOUT[40])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y240" ))
  DOUT_40_OBUF (
    .I(DOUT_40_OBUF_1355),
    .O(DOUT[40])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y266" ))
  \DOUT(32)/PAD  (
    .PAD(DOUT[32])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y266" ))
  DOUT_32_OBUF (
    .I(DOUT_32_OBUF_1352),
    .O(DOUT[32])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y280" ))
  \DOUT(24)/PAD  (
    .PAD(DOUT[24])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y280" ))
  DOUT_24_OBUF (
    .I(DOUT_24_OBUF_1348),
    .O(DOUT[24])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y283" ))
  \DOUT(16)/PAD  (
    .PAD(DOUT[16])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y283" ))
  DOUT_16_OBUF (
    .I(DOUT_16_OBUF_1592),
    .O(DOUT[16])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y298" ))
  \DOUT(41)/PAD  (
    .PAD(DOUT[41])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y298" ))
  DOUT_41_OBUF (
    .I(DOUT_41_OBUF_1367),
    .O(DOUT[41])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y270" ))
  \DOUT(33)/PAD  (
    .PAD(DOUT[33])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y270" ))
  DOUT_33_OBUF (
    .I(DOUT_33_OBUF_1364),
    .O(DOUT[33])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y281" ))
  \DOUT(25)/PAD  (
    .PAD(DOUT[25])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y281" ))
  DOUT_25_OBUF (
    .I(DOUT_25_OBUF_1361),
    .O(DOUT[25])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y282" ))
  \DOUT(17)/PAD  (
    .PAD(DOUT[17])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y282" ))
  DOUT_17_OBUF (
    .I(DOUT_17_OBUF_1358),
    .O(DOUT[17])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y289" ))
  \DOUT(50)/PAD  (
    .PAD(DOUT[50])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y289" ))
  DOUT_50_OBUF (
    .I(DOUT_50_OBUF_1382),
    .O(DOUT[50])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y297" ))
  \DOUT(42)/PAD  (
    .PAD(DOUT[42])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y297" ))
  DOUT_42_OBUF (
    .I(DOUT_42_OBUF_1379),
    .O(DOUT[42])
  );
  X_INV #(
    .LOC ( "RAMB36_X0Y27" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDRCLKLINV  (
    .I(VCC),
    .O
(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDRCLKL_INTNOT )

  );
  X_INV #(
    .LOC ( "RAMB36_X0Y27" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDRCLKUINV  (
    .I(VCC),
    .O
(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDRCLKU_INTNOT )

  );
  X_RAMB36SDP_EXP #(
    .DO_REG ( 0 ),
    .EN_ECC_WRITE ( "FALSE" ),
    .EN_ECC_READ ( "FALSE" ),
    .EN_ECC_SCRUB ( "FALSE" ),
    .INIT_FILE ( "NONE" ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .INIT ( 72'h000000000000000000 ),
    .SRVAL ( 72'h000000000000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_40 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_41 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_42 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_43 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_44 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_45 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_46 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_47 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_48 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_49 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_50 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_51 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_52 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_53 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_54 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_55 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_56 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_57 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_58 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_59 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_60 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_61 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_62 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_63 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_64 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_65 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_66 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_67 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_68 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_69 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_70 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_71 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_72 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_73 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_74 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_75 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_76 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_77 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_78 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_79 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .LOC ( "RAMB36_X0Y27" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP  (
    .RDENU(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/tmp_ram_rd_en ),
    .RDENL(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/tmp_ram_rd_en ),
    .WRENU(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .WRENL(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .SSRU(SRST_IBUF_1350),
    .SSRL(SRST_IBUF_1350),
    .RDCLKU(clk_i),
    .RDCLKL(clk_i),
    .WRCLKU(clk_i),
    .WRCLKL(clk_i),
    .RDRCLKU
(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDRCLKU_INTNOT )
,
    .RDRCLKL
(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDRCLKL_INTNOT )
,
    .REGCEU(GND),
    .REGCEL(GND),
    .SBITERR
(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/SBITERR )
,
    .DBITERR
(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DBITERR )
,
    .DI({\DIN(63)/IBUF , \DIN(62)/IBUF , \DIN(61)/IBUF , \DIN(60)/IBUF , \DIN(59)/IBUF , \DIN(58)/IBUF , \DIN(57)/IBUF , \DIN(56)/IBUF , 
\DIN(55)/IBUF , \DIN(54)/IBUF , \DIN(53)/IBUF , \DIN(52)/IBUF , \DIN(51)/IBUF , \DIN(50)/IBUF , \DIN(49)/IBUF , \DIN(48)/IBUF , \DIN(47)/IBUF , 
\DIN(46)/IBUF , \DIN(45)/IBUF , \DIN(44)/IBUF , \DIN(43)/IBUF , \DIN(42)/IBUF , \DIN(41)/IBUF , \DIN(40)/IBUF , \DIN(39)/IBUF , \DIN(38)/IBUF , 
\DIN(37)/IBUF , \DIN(36)/IBUF , \DIN(35)/IBUF , \DIN(34)/IBUF , \DIN(33)/IBUF , \DIN(32)/IBUF , \DIN(31)/IBUF , \DIN(30)/IBUF , \DIN(29)/IBUF , 
\DIN(28)/IBUF , \DIN(27)/IBUF , \DIN(26)/IBUF , \DIN(25)/IBUF , \DIN(24)/IBUF , \DIN(23)/IBUF , \DIN(22)/IBUF , \DIN(21)/IBUF , \DIN(20)/IBUF , 
\DIN(19)/IBUF , \DIN(18)/IBUF , \DIN(17)/IBUF , \DIN(16)/IBUF , \DIN(15)/IBUF , \DIN(14)/IBUF , \DIN(13)/IBUF , \DIN(12)/IBUF , \DIN(11)/IBUF , 
\DIN(10)/IBUF , \DIN(9)/IBUF , \DIN(8)/IBUF , \DIN(7)/IBUF , \DIN(6)/IBUF , \DIN(5)/IBUF , \DIN(4)/IBUF , \DIN(3)/IBUF , \DIN(2)/IBUF , \DIN(1)/IBUF 
, \DIN(0)/IBUF }),
    .DIP({GND, GND, GND, GND, GND, GND, GND, GND}),
    .RDADDRL({VCC, \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [8], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [7], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [6], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [5], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [4], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [0], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL5 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL4 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL3 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL2 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL1 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRL0 
}),
    .RDADDRU({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [8], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [7], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [6], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [5], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [4], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [0], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU5 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU4 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU3 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU2 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU1 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/RDADDRU0 
}),
    .WRADDRL({VCC, \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [8], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [7], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [6], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [5], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [4], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [0], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL5 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL4 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL3 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL2 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL1 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRL0 
}),
    .WRADDRU({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [8], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [7], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [6], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [5], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [4], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [0], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU5 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU4 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU3 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU2 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU1 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/WRADDRU0 
}),
    .WEU({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en }),
    .WEL({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en , \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en }),
    .DO({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [63], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [62], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [61], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [60], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [59], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [58], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [57], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [56], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [55], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [54], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [53], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [52], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [51], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [50], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [49], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [48], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [47], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [46], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [45], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [44], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [43], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [42], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [41], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [40], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [39], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [38], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [37], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [36], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [35], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [34], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [33], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [32], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [31], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [30], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [29], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [28], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [27], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [26], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [25], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [24], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [23], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [22], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [21], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [20], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [19], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [18], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [17], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [16], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [15], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [14], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [13], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [12], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [11], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [10], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [9], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [8], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [7], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [6], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [5], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [4], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [0]}),
    .DOP({
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP7 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP6 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP5 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP4 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP3 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP2 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP1 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/DOP0 
}),
    .ECCPARITY({
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY7 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY6 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY5 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY4 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY3 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY2 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY1 
, 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v5_noinit.ram/SDP.WIDE_PRIM36.noeccerr.SDP/ECCPARITY0 
})
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y265" ))
  \DOUT(34)/PAD  (
    .PAD(DOUT[34])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y265" ))
  DOUT_34_OBUF (
    .I(DOUT_34_OBUF_1376),
    .O(DOUT[34])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y313" ))
  \DOUT(26)/PAD  (
    .PAD(DOUT[26])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y313" ))
  DOUT_26_OBUF (
    .I(DOUT_26_OBUF_1373),
    .O(DOUT[26])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y281" ))
  \DOUT(18)/PAD  (
    .PAD(DOUT[18])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y281" ))
  DOUT_18_OBUF (
    .I(DOUT_18_OBUF_1370),
    .O(DOUT[18])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y288" ))
  \DOUT(51)/PAD  (
    .PAD(DOUT[51])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y288" ))
  DOUT_51_OBUF (
    .I(DOUT_51_OBUF_1397),
    .O(DOUT[51])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y296" ))
  \DOUT(43)/PAD  (
    .PAD(DOUT[43])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y296" ))
  DOUT_43_OBUF (
    .I(DOUT_43_OBUF_1394),
    .O(DOUT[43])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y307" ))
  \DOUT(35)/PAD  (
    .PAD(DOUT[35])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y307" ))
  DOUT_35_OBUF (
    .I(DOUT_35_OBUF_1391),
    .O(DOUT[35])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y312" ))
  \DOUT(27)/PAD  (
    .PAD(DOUT[27])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y312" ))
  DOUT_27_OBUF (
    .I(DOUT_27_OBUF_1388),
    .O(DOUT[27])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y280" ))
  \DOUT(19)/PAD  (
    .PAD(DOUT[19])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y280" ))
  DOUT_19_OBUF (
    .I(DOUT_19_OBUF_1385),
    .O(DOUT[19])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y324" ))
  \DOUT(60)/PAD  (
    .PAD(DOUT[60])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y324" ))
  DOUT_60_OBUF (
    .I(DOUT_60_OBUF_1412),
    .O(DOUT[60])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y287" ))
  \DOUT(52)/PAD  (
    .PAD(DOUT[52])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y287" ))
  DOUT_52_OBUF (
    .I(DOUT_52_OBUF_1409),
    .O(DOUT[52])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y295" ))
  \DOUT(44)/PAD  (
    .PAD(DOUT[44])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y295" ))
  DOUT_44_OBUF (
    .I(DOUT_44_OBUF_1406),
    .O(DOUT[44])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y267" ))
  \DOUT(36)/PAD  (
    .PAD(DOUT[36])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y267" ))
  DOUT_36_OBUF (
    .I(DOUT_36_OBUF_1403),
    .O(DOUT[36])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y311" ))
  \DOUT(28)/PAD  (
    .PAD(DOUT[28])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y311" ))
  DOUT_28_OBUF (
    .I(DOUT_28_OBUF_1400),
    .O(DOUT[28])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y235" ))
  \DOUT(61)/PAD  (
    .PAD(DOUT[61])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y235" ))
  DOUT_61_OBUF (
    .I(DOUT_61_OBUF_1427),
    .O(DOUT[61])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y286" ))
  \DOUT(53)/PAD  (
    .PAD(DOUT[53])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y286" ))
  DOUT_53_OBUF (
    .I(DOUT_53_OBUF_1424),
    .O(DOUT[53])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y294" ))
  \DOUT(45)/PAD  (
    .PAD(DOUT[45])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y294" ))
  DOUT_45_OBUF (
    .I(DOUT_45_OBUF_1421),
    .O(DOUT[45])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y250" ))
  \DOUT(37)/PAD  (
    .PAD(DOUT[37])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y250" ))
  DOUT_37_OBUF (
    .I(DOUT_37_OBUF_1418),
    .O(DOUT[37])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y310" ))
  \DOUT(29)/PAD  (
    .PAD(DOUT[29])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y310" ))
  DOUT_29_OBUF (
    .I(DOUT_29_OBUF_1415),
    .O(DOUT[29])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y268" ))
  \DOUT(62)/PAD  (
    .PAD(DOUT[62])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y268" ))
  DOUT_62_OBUF (
    .I(DOUT_62_OBUF_1439),
    .O(DOUT[62])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y285" ))
  \DOUT(54)/PAD  (
    .PAD(DOUT[54])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y285" ))
  DOUT_54_OBUF (
    .I(DOUT_54_OBUF_1436),
    .O(DOUT[54])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y246" ))
  \DOUT(46)/PAD  (
    .PAD(DOUT[46])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y246" ))
  DOUT_46_OBUF (
    .I(DOUT_46_OBUF_1433),
    .O(DOUT[46])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y301" ))
  \DOUT(38)/PAD  (
    .PAD(DOUT[38])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y301" ))
  DOUT_38_OBUF (
    .I(DOUT_38_OBUF_1430),
    .O(DOUT[38])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y252" ))
  \DOUT(63)/PAD  (
    .PAD(DOUT[63])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y252" ))
  DOUT_63_OBUF (
    .I(DOUT_63_OBUF_1451),
    .O(DOUT[63])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y284" ))
  \DOUT(55)/PAD  (
    .PAD(DOUT[55])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y284" ))
  DOUT_55_OBUF (
    .I(DOUT_55_OBUF_1448),
    .O(DOUT[55])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y292" ))
  \DOUT(47)/PAD  (
    .PAD(DOUT[47])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y292" ))
  DOUT_47_OBUF (
    .I(DOUT_47_OBUF_1445),
    .O(DOUT[47])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y256" ))
  \DOUT(39)/PAD  (
    .PAD(DOUT[39])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y256" ))
  DOUT_39_OBUF (
    .I(DOUT_39_OBUF_1442),
    .O(DOUT[39])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y283" ))
  \DOUT(56)/PAD  (
    .PAD(DOUT[56])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y283" ))
  DOUT_56_OBUF (
    .I(DOUT_56_OBUF_1457),
    .O(DOUT[56])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y291" ))
  \DOUT(48)/PAD  (
    .PAD(DOUT[48])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y291" ))
  DOUT_48_OBUF (
    .I(DOUT_48_OBUF_1454),
    .O(DOUT[48])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y282" ))
  \DOUT(57)/PAD  (
    .PAD(DOUT[57])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y282" ))
  DOUT_57_OBUF (
    .I(DOUT_57_OBUF_1463),
    .O(DOUT[57])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y290" ))
  \DOUT(49)/PAD  (
    .PAD(DOUT[49])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y290" ))
  DOUT_49_OBUF (
    .I(DOUT_49_OBUF_1460),
    .O(DOUT[49])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y314" ))
  \DOUT(58)/PAD  (
    .PAD(DOUT[58])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y314" ))
  DOUT_58_OBUF (
    .I(DOUT_58_OBUF_1466),
    .O(DOUT[58])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y315" ))
  \DOUT(59)/PAD  (
    .PAD(DOUT[59])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y315" ))
  DOUT_59_OBUF (
    .I(DOUT_59_OBUF_1469),
    .O(DOUT[59])
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y305" ))
  \DIN(10)/PAD  (
    .PAD(DIN[10])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y305" ))
  DIN_10_IBUF (
    .I(DIN[10]),
    .O(\DIN(10)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y264" ))
  \DIN(11)/PAD  (
    .PAD(DIN[11])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y264" ))
  DIN_11_IBUF (
    .I(DIN[11]),
    .O(\DIN(11)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y255" ))
  \DIN(20)/PAD  (
    .PAD(DIN[20])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y255" ))
  DIN_20_IBUF (
    .I(DIN[20]),
    .O(\DIN(20)/IBUF )
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y263" ))
  \DIN(12)/PAD  (
    .PAD(DIN[12])
  );
  X_BUF #(
    .LOC ( "IOB_X0Y263" ))
  DIN_12_IBUF (
    .I(DIN[12]),
    .O(\DIN(12)/IBUF )
  );
  X_FF #(
    .LOC ( "SLICE_X3Y115" ),
    .INIT ( 1'b1 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/empty_fwft_i  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/empty_fwft_i_mux0000 ),
    .O(EMPTY_OBUF_1522),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y132" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_3  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [3]),
    .O(DOUT_3_OBUF_1511),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y136" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_31  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [31]),
    .O(DOUT_31_OBUF_1589),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y136" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_35  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [35]),
    .O(DOUT_35_OBUF_1391),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y136" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_34  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [34]),
    .O(DOUT_34_OBUF_1376),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y137" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_54  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [54]),
    .O(DOUT_54_OBUF_1436),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y137" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_55  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [55]),
    .O(DOUT_55_OBUF_1448),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y137" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_56  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [56]),
    .O(DOUT_56_OBUF_1457),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_22  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [22]),
    .O(DOUT_22_OBUF_1587),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_24  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [24]),
    .O(DOUT_24_OBUF_1348),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_21  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [21]),
    .O(DOUT_21_OBUF_1584),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_25  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [25]),
    .O(DOUT_25_OBUF_1361),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y139" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_20  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [20]),
    .O(DOUT_20_OBUF_1582),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y139" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_28  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [28]),
    .O(DOUT_28_OBUF_1400),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y139" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_27  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [27]),
    .O(DOUT_27_OBUF_1388),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y139" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_26  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [26]),
    .O(DOUT_26_OBUF_1373),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y140" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_49  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [49]),
    .O(DOUT_49_OBUF_1460),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y140" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_48  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [48]),
    .O(DOUT_48_OBUF_1454),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X6Y140" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_53  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [53]),
    .O(DOUT_53_OBUF_1424),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y132" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_46  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [46]),
    .O(DOUT_46_OBUF_1433),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_37  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [37]),
    .O(DOUT_37_OBUF_1418),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_39  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [39]),
    .O(DOUT_39_OBUF_1442),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_40  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [40]),
    .O(DOUT_40_OBUF_1355),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y134" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_61  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [61]),
    .O(DOUT_61_OBUF_1427),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y134" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_62  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [62]),
    .O(DOUT_62_OBUF_1439),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y134" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_63  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [63]),
    .O(DOUT_63_OBUF_1451),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_32  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [32]),
    .O(DOUT_32_OBUF_1352),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_33  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [33]),
    .O(DOUT_33_OBUF_1364),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_36  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [36]),
    .O(DOUT_36_OBUF_1403),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y136" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_47  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [47]),
    .O(DOUT_47_OBUF_1445),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y137" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_50  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [50]),
    .O(DOUT_50_OBUF_1382),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y137" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_51  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [51]),
    .O(DOUT_51_OBUF_1397),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y137" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_52  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [52]),
    .O(DOUT_52_OBUF_1409),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_41  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [41]),
    .O(DOUT_41_OBUF_1367),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_59  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [59]),
    .O(DOUT_59_OBUF_1469),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_45  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [45]),
    .O(DOUT_45_OBUF_1421),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_58  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [58]),
    .O(DOUT_58_OBUF_1466),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y139" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_44  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [44]),
    .O(DOUT_44_OBUF_1406),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y139" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_43  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [43]),
    .O(DOUT_43_OBUF_1394),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y140" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_29  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [29]),
    .O(DOUT_29_OBUF_1415),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y140" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_30  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [30]),
    .O(DOUT_30_OBUF_1586),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y141" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_13  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [13]),
    .O(DOUT_13_OBUF_1585),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X7Y143" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_60  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [60]),
    .O(DOUT_60_OBUF_1412),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X8Y119" ),
    .INIT ( 64'hFFFFFFFFCF0CCC0C ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/empty_fwft_i_mux00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/empty_fwft_fb_1481 ),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1_1478 ),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd2_1476 ),
    .ADR4(RD_EN_IBUF_1475),
    .ADR5(SRST_IBUF_1350),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/empty_fwft_i_mux0000 )
  );
  X_FF #(
    .LOC ( "SLICE_X8Y120" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_i  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_i_mux0000 ),
    .O(FULL_OBUF_1472),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X8Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_38  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [38]),
    .O(DOUT_38_OBUF_1430),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X8Y138" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_42  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [42]),
    .O(DOUT_42_OBUF_1379),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X9Y119" ),
    .INIT ( 1'b1 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/empty_fwft_fb  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/empty_fwft_i_mux0000 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/empty_fwft_fb_1481 ),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X20Y127" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd2  (
    .CE(RD_EN_IBUF_1475),
    .CLK(clk_i),
    .I(1'b0),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd2_1476 ),
    .SSET(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1_1478 ),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X20Y133" ),
    .INIT ( 64'hFF00FF000000FF00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/RAM_REGOUT_EN1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1_1478 ),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd2_1476 ),
    .ADR5(RD_EN_IBUF_1475),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en )
  );
  X_SFF #(
    .LOC ( "SLICE_X20Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_1  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [1]),
    .O(DOUT_1_OBUF_1505),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X20Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_4  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [4]),
    .O(DOUT_4_OBUF_1515),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X20Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_2  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [2]),
    .O(DOUT_2_OBUF_1508),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X21Y141" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_57  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [57]),
    .O(DOUT_57_OBUF_1463),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X22Y133" ),
    .INIT ( 64'hFFFFFFFF33330333 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/tmp_ram_rd_en1  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_1519 ),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd2_1476 ),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1_1478 ),
    .ADR4(RD_EN_IBUF_1475),
    .ADR5(SRST_IBUF_1350),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/tmp_ram_rd_en )
  );
  X_SFF #(
    .LOC ( "SLICE_X23Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1-In ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1_1478 ),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X23Y133" ),
    .INIT ( 64'h0F0F0F0FFF0F0F0F ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1-In1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_1519 ),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1_1478 ),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd2_1476 ),
    .ADR5(RD_EN_IBUF_1475),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1-In )
  );
  X_SFF #(
    .LOC ( "SLICE_X23Y142" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_23  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [23]),
    .O(DOUT_23_OBUF_1590),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X24Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_fb_i  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_i_mux0000 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_fb_i_1518 ),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X26Y133" ),
    .INIT ( 64'h0C040C000C000C00 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/rd_pntr_wr_inv_pad(0)_mand1  (
    .ADR0(RD_EN_IBUF_1475),
    .ADR1(WR_EN_IBUF_1517),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_fb_i_1518 ),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_1519 ),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd2_1476 ),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1_1478 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/rd_pntr_wr_inv_pad(0)_mand1_1516 )
  );
  X_SFF #(
    .LOC ( "SLICE_X29Y131" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/prog_full_i  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/prog_full_i_and0001_1512 ),
    .CLK(clk_i),
    .I(1'b0),
    .O(PROG_FULL_OBUF_1513),
    .SSET(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/prog_full_i_and0000_1514 ),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y131" ),
    .INIT ( 64'h0000000000000000 ))
  \fg0/N0_21.SLICEL_D6LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\NLW_fg0/N0_21.SLICEL_D6LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y132" ),
    .INIT ( 64'hFFFFFFFFFFBFFFFF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/prog_full_i_and0001_SW0  (
    .ADR0(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [1]),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [9]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [8]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [3]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_rd_en_i_1621 ),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [4]),
    .O(\fg0/N4 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y132" ),
    .INIT ( 64'h0000000008000000 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/prog_full_i_and0001  (
    .ADR0(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [5]),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [2]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_wr_en_i_1622 ),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [7]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [6]),
    .ADR5(\fg0/N4 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/prog_full_i_and0001_1512 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y132" ),
    .INIT ( 64'hFFFFFFFFFFFFFFBF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/prog_full_i_and0000_SW0  (
    .ADR0(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [4]),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [5]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [2]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [3]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [1]),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_rd_en_i_1621 ),
    .O(\fg0/N6 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y132" ),
    .INIT ( 64'h0000000080000000 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/prog_full_i_and0000  (
    .ADR0(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [9]),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [6]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_wr_en_i_1622 ),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [8]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/diff_pntr_pad [7]),
    .ADR5(\fg0/N6 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/prog_full_i_and0000_1514 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X31Y133" ),
    .INIT ( 64'h0032303200303030 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_i_mux00001  (
    .ADR0(WR_EN_IBUF_1517),
    .ADR1(SRST_IBUF_1350),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_fb_i_1518 ),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp0_0 ),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp1_0 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_i_mux0000 )
  );
  X_SFF #(
    .LOC ( "SLICE_X31Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_rd_en_i  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_rd_en_i_1621 ),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X31Y133" ),
    .INIT ( 64'h00F000FF00FF00FF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/RAM_RD_EN_FWFT1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(RD_EN_IBUF_1475),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_1519 ),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd2_1476 ),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.rfwft/curr_fwft_state_FSM_FFd1_1478 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en )
  );
  X_SFF #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1_3  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [3]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [3]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1_3_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [7]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [7]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [6]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [6]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1 [3])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_28.SLICEL_D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_28.SLICEL_D5LUT_O_UNCONNECTED )
  );
  X_ONE #(
    .LOC ( "SLICE_X31Y135" ))
  \ProtoComp42.CYINITVCC  (
    .O(\NLW_ProtoComp42.CYINITVCC_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1_2  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [2]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [2]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X31Y135" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms  (
    .CI(1'b0),
    .CYINIT(1'b1),
    .CO({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/carrynet [3], 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_O[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_O[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_O[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms_O[0]_UNCONNECTED }),
    .S({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1 [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1 [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1 [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1 [0]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1_2_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [5]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [5]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [4]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [4]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1 [2])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_29.SLICEL_C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_29.SLICEL_C5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1_1  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [1]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [1]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1_1_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [3]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [3]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [2]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [2]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1 [1])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_30.SLICEL_B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_30.SLICEL_B5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1_0  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [0]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [0]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1_0_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [1]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [1]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [0]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [0]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1 [0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X31Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_31.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_31.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_BUF 
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1(8)/fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1(8)_AMUX_Delay  (
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp1 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp1_0 )
  );
  X_SFF #(
    .LOC ( "SLICE_X31Y136" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1_8  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [8]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [8]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X31Y136" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms  (
    .CI(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/carrynet [3]),
    .CYINIT(1'b0),
    .CO({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_CO[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_CO[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp1 }),
    .DI({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_DI[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_DI[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_DI[1]_UNCONNECTED , 1'b0}),
    .O({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_O[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_O[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_O[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_O[0]_UNCONNECTED }),
    .S({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_S[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_S[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms_S[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1 [4]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X31Y136" ),
    .INIT ( 64'hFF0000FFFF0000FF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1_4_not00001  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [8]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [8]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c1/v1 [4])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X31Y136" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_27.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_27.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y133" ),
    .INIT ( 64'hFFFFFFFF0000FFFF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_mux0000_SW0  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(WR_EN_IBUF_1517),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_fb_i_1518 ),
    .O(\fg0/N8 )
  );
  X_FF #(
    .LOC ( "SLICE_X32Y133" ),
    .INIT ( 1'b1 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_mux0000_1045 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_1519 ),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y133" ),
    .INIT ( 64'hEEEAEEAAFFEAFFAA ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_mux0000  (
    .ADR0(SRST_IBUF_1350),
    .ADR1(\fg0/N8 ),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_1519 ),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp1_0 ),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/comp0_0 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/ram_empty_fb_i_mux0000_1045 )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1_7  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [7]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [7]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 64'hC0300C03C0300C03 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1_3_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [7]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [6]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [7]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [6]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1 [3])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_23.SLICEL_D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_23.SLICEL_D5LUT_O_UNCONNECTED )
  );
  X_ONE #(
    .LOC ( "SLICE_X32Y135" ))
  \ProtoComp45.CYINITVCC  (
    .O(\NLW_ProtoComp45.CYINITVCC_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1_6  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [6]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [6]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X32Y135" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms  (
    .CI(1'b0),
    .CYINIT(1'b1),
    .CO({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/carrynet [3], 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_O[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_O[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_O[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms_O[0]_UNCONNECTED }),
    .S({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1 [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1 [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1 [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1 [0]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1_2_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [5]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [5]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [4]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [4]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1 [2])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_24.SLICEL_C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_24.SLICEL_C5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1_5  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [5]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [5]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1_1_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [3]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [3]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [2]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [2]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1 [1])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_25.SLICEL_B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_25.SLICEL_B5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1_4  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count [4]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [4]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1_0_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [1]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [1]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [0]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [0]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1 [0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_26.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_26.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_BUF 
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1(8)/fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1(8)_AMUX_Delay  (
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp0 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp0_0 )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y136" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1_8  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [8]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [8]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X32Y136" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms  (
    .CI(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/carrynet [3]),
    .CYINIT(1'b0),
    .CO({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_CO[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_CO[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/comp0 }),
    .DI({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_DI[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_DI[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_DI[1]_UNCONNECTED , 1'b0}),
    .O({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_O[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_O[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_O[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_O[0]_UNCONNECTED }),
    .S({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_S[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_S[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms_S[1]_UNCONNECTED , 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1 [4]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X32Y136" ),
    .INIT ( 64'hFF0000FFFF0000FF ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1_4_not00001  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [8]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [8]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/c0/v1 [4])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X32Y136" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_22.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_22.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X33Y133" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_wr_en_i  (
    .CE(VCC),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_wr_en_i_1622 ),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X33Y133" ),
    .INIT ( 64'h00000000FFFF0000 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/ram_wr_en_i1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(WR_EN_IBUF_1517),
    .ADR5(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwss.wsts/ram_full_fb_i_1518 ),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_wr_en )
  );
  X_SFF #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1_7  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [7]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [7]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1_3_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [7]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [7]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [6]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [6]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1 [3])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_38.SLICEL_D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_38.SLICEL_D5LUT_O_UNCONNECTED )
  );
  X_ONE #(
    .LOC ( "SLICE_X33Y135" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1(7)/ProtoComp42.CYINITVCC  (
    .O(\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1(7)/ProtoComp42.CYINITVCC_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1_6  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [6]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [6]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X33Y135" ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms  (
    .CI(1'b0),
    .CYINIT(1'b1),
    .CO({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/carrynet [3], 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_CO[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_CO[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_O[3]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_O[2]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_O[1]_UNCONNECTED , 
\NLW_fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms_O[0]_UNCONNECTED }),
    .S({\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1 [3], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1 [2], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1 [1], 
\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1 [0]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1_2_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [5]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [5]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [4]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [4]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1 [2])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_39.SLICEL_C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_39.SLICEL_C5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1_5  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [5]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [5]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1_1_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [3]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [3]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [2]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [2]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1 [1])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_40.SLICEL_B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_40.SLICEL_B5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1_4  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [4]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [4]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 64'hC30000C3C30000C3 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1_0_and00001  (
    .ADR0(1'b1),
    .ADR1(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [1]),
    .ADR2(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [1]),
    .ADR3(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [0]),
    .ADR4(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/wpntr/count_d1 [0]),
    .ADR5(1'b1),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/grss.rsts/c2/v1 [0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X33Y135" ),
    .INIT ( 32'h00000000 ))
  \fg0/N0_41.SLICEL_A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_fg0/N0_41.SLICEL_A5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X38Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1_3  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [3]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [3]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X38Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1_2  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [2]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [2]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X38Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1_1  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [1]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [1]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X38Y135" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1_0  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_rd_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count [0]),
    .O(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/count_d1 [0]),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X72Y139" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_18  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [18]),
    .O(DOUT_18_OBUF_1370),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X72Y140" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_16  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [16]),
    .O(DOUT_16_OBUF_1592),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X72Y140" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_19  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [19]),
    .O(DOUT_19_OBUF_1385),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X72Y140" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_17  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [17]),
    .O(DOUT_17_OBUF_1358),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X72Y141" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_14  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [14]),
    .O(DOUT_14_OBUF_1588),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X72Y141" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_15  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [15]),
    .O(DOUT_15_OBUF_1591),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X72Y144" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_12  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [12]),
    .O(DOUT_12_OBUF_1583),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X72Y144" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_11  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [11]),
    .O(DOUT_11_OBUF_1581),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X72Y144" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_10  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [10]),
    .O(DOUT_10_OBUF_1580),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X72Y144" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_9  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [9]),
    .O(DOUT_9_OBUF_1525),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X73Y143" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_8  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [8]),
    .O(DOUT_8_OBUF_1524),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X73Y143" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_7  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [7]),
    .O(DOUT_7_OBUF_1523),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X73Y143" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_6  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [6]),
    .O(DOUT_6_OBUF_1521),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X73Y143" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_5  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [5]),
    .O(DOUT_5_OBUF_1520),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X73Y144" ),
    .INIT ( 1'b0 ))
  \fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_i_0  (
    .CE(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/ram_regout_en ),
    .CLK(clk_i),
    .I(\fg0/U0/xst_fifo_generator/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/dout_mem [0]),
    .O(DOUT_0_OBUF_1502),
    .SSET(GND),
    .SRST(SRST_IBUF_1350),
    .SET(GND),
    .RST(GND)
  );
  X_CKBUF #(
    .LOC ( "BUFGCTRL_X0Y0" ))
  \clk_buf/BUF  (
    .I(\CLK/IBUF ),
    .O(clk_i)
  );
  X_ZERO   NlwBlock_fifo_64x512_top_GND (
    .O(GND)
  );
  X_ONE   NlwBlock_fifo_64x512_top_VCC (
    .O(VCC)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

