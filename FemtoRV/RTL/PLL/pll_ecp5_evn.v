/* 
 * Do not edit this file, it was generated by gen_pll.sh
 * 
 *   FPGA kind      : ECP5
 *   Input frequency: 12 MHz
 */

 module femtoPLL #(
    parameter freq = 60
 ) (
    input wire pclk,
    output wire clk
 );
   generate
     case(freq)
     20: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=30;
      parameter CLKOP_CPHASE=15;
      parameter CLKFB_DIV=5;
     end
     25: begin
      parameter CLKI_DIV=1;
      parameter CLKOP_DIV=25;
      parameter CLKOP_CPHASE=12;
      parameter CLKFB_DIV=2;
     end
     30: begin
      parameter CLKI_DIV=2;
      parameter CLKOP_DIV=20;
      parameter CLKOP_CPHASE=9;
      parameter CLKFB_DIV=5;
     end
     35: begin
      parameter CLKI_DIV=1;
      parameter CLKOP_DIV=17;
      parameter CLKOP_CPHASE=8;
      parameter CLKFB_DIV=3;
     end
     40: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=15;
      parameter CLKOP_CPHASE=7;
      parameter CLKFB_DIV=10;
     end
     45: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=14;
      parameter CLKOP_CPHASE=6;
      parameter CLKFB_DIV=11;
     end
     50: begin
      parameter CLKI_DIV=1;
      parameter CLKOP_DIV=12;
      parameter CLKOP_CPHASE=5;
      parameter CLKFB_DIV=4;
     end
     55: begin
      parameter CLKI_DIV=2;
      parameter CLKOP_DIV=11;
      parameter CLKOP_CPHASE=5;
      parameter CLKFB_DIV=9;
     end
     60: begin
      parameter CLKI_DIV=1;
      parameter CLKOP_DIV=10;
      parameter CLKOP_CPHASE=4;
      parameter CLKFB_DIV=5;
     end
     65: begin
      parameter CLKI_DIV=2;
      parameter CLKOP_DIV=9;
      parameter CLKOP_CPHASE=4;
      parameter CLKFB_DIV=11;
     end
     70: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=9;
      parameter CLKOP_CPHASE=4;
      parameter CLKFB_DIV=17;
     end
     75: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=8;
      parameter CLKOP_CPHASE=3;
      parameter CLKFB_DIV=19;
     end
     80: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=7;
      parameter CLKOP_CPHASE=3;
      parameter CLKFB_DIV=20;
     end
     85: begin
      parameter CLKI_DIV=1;
      parameter CLKOP_DIV=7;
      parameter CLKOP_CPHASE=3;
      parameter CLKFB_DIV=7;
     end
     90: begin
      parameter CLKI_DIV=2;
      parameter CLKOP_DIV=7;
      parameter CLKOP_CPHASE=3;
      parameter CLKFB_DIV=15;
     end
     95: begin
      parameter CLKI_DIV=1;
      parameter CLKOP_DIV=6;
      parameter CLKOP_CPHASE=2;
      parameter CLKFB_DIV=8;
     end
     100: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=6;
      parameter CLKOP_CPHASE=2;
      parameter CLKFB_DIV=25;
     end
     105: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=6;
      parameter CLKOP_CPHASE=3;
      parameter CLKFB_DIV=26;
     end
     110: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=5;
      parameter CLKOP_CPHASE=2;
      parameter CLKFB_DIV=28;
     end
     115: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=5;
      parameter CLKOP_CPHASE=2;
      parameter CLKFB_DIV=29;
     end
     120: begin
      parameter CLKI_DIV=1;
      parameter CLKOP_DIV=5;
      parameter CLKOP_CPHASE=2;
      parameter CLKFB_DIV=10;
     end
     125: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=5;
      parameter CLKOP_CPHASE=2;
      parameter CLKFB_DIV=31;
     end
     130: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=5;
      parameter CLKOP_CPHASE=2;
      parameter CLKFB_DIV=32;
     end
     135: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=4;
      parameter CLKOP_CPHASE=2;
      parameter CLKFB_DIV=34;
     end
     140: begin
      parameter CLKI_DIV=3;
      parameter CLKOP_DIV=4;
      parameter CLKOP_CPHASE=1;
      parameter CLKFB_DIV=35;
     end
      endcase
   endgenerate
(* ICP_CURRENT="12" *) (* LPF_RESISTOR="8" *) (* MFG_ENABLE_FILTEROPAMP="1" *) (* MFG_GMCREF_SEL="2" *)
EHXPLLL #(
        .PLLRST_ENA("DISABLED"),
        .INTFB_WAKE("DISABLED"),
        .STDBY_ENABLE("DISABLED"),
        .DPHASE_SOURCE("DISABLED"),
        .OUTDIVIDER_MUXA("DIVA"),
        .OUTDIVIDER_MUXB("DIVB"),
        .OUTDIVIDER_MUXC("DIVC"),
        .OUTDIVIDER_MUXD("DIVD"),
        .CLKI_DIV(CLKI_DIV),
        .CLKOP_ENABLE("ENABLED"),
        .CLKOP_DIV(CLKOP_DIV),
        .CLKOP_CPHASE(CLKOP_CPHASE),
        .CLKOP_FPHASE(0),
        .FEEDBK_PATH("CLKOP"),
        .CLKFB_DIV(CLKFB_DIV)
    ) pll_i (
        .RST(1'b0),
        .STDBY(1'b0),
        .CLKI(pclk),
        .CLKOP(clk),
        .CLKFB(clk),
        .CLKINTFB(),
        .PHASESEL0(1'b0),
        .PHASESEL1(1'b0),
        .PHASEDIR(1'b1),
        .PHASESTEP(1'b1),
        .PHASELOADREG(1'b1),
        .PLLWAKESYNC(1'b0),
        .ENCLKOP(1'b0)
	);
endmodule  
