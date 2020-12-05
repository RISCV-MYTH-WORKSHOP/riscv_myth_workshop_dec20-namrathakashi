\m4_TLV_version 1d: tl-x.org
\SV
//Calculator labs solutions here

//Lab1: Combinational calculator

\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   $val1[31:0] = $rand1[3:0];
   $val2[31:0] = $rand2[3:0];
   
   $sum[31:0]  = $val1 + $val2;
   $diff[31:0] = $val1 - $val2;
   $prod[31:0] = $val1 * $val2;
   $quot[31:0] = $val1 / $val2;
   $cnt[31:0]  = $reset ? 0 : (>>1$cnt + 1);
   
   //Combinational calculator lab
   $out[31:0] = (($op[1:0] == 00) ? $sum :
                (($op[1:0] == 01) ? $diff:
                (($op[1:0] == 10) ? $prod: $quot)));
   
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule


//Lab2: Sequential Calculator

\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   $val1 = >>1$out;
   $val2 = $rand[31:0];
   $sum[31:0]  = $val1 + $val2;
   $diff[31:0] = $val1 - $val2;
   $prod[31:0] = $val1 * $val2;
   $quot[31:0] = $val1 / $val2;
   $cnt[31:0] = $reset ? 0 : (>>1$cnt + 1);
   
   
   //Sequential calculator lab
   $out[31:0] = $reset ? 32'b0 :
                            (($op[1:0] == 2'b00) ? $sum  :
                            (($op[1:0] == 2'b01) ? $diff :
                            (($op[1:0] == 2'b10) ? $prod : $quot)));
                            
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
