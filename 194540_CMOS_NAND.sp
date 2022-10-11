* SPICE export by:  S-Edit 16.01
* Export time:      Sat Feb 26 14:20:55 2022
* Design:           194540_CMOS_NAND
* Cell:             194540_CMOS_NAND
* Interface:        view0
* View:             view0
* View type:        connectivity
* Export as:        top-level cell
* Export mode:      hierarchical
* Exclude empty cells: yes
* Exclude .model:   no
* Exclude .end:     no
* Exclude simulator commands:     no
* Expand paths:     yes
* Wrap lines:       no
* Root path:        C:\Users\ishan\Documents\Tanner EDA\Tanner Tools v16.0\My_designs\194540_CMOS_NAND
* Exclude global pins:   no
* Exclude instance locations: no
* Control property name(s): SPICE

********* Simulation Settings - General Section *********

***** Top Level *****
***** Ishan_194540 *****
.include "D:\NITH\6th Sem\VLSI Lab\Tanner_tool\model file\BPTM_Models files\180nm.md"

MNMOS_1 Y A N_1 GND NMOS W=270n L=180n AS=243f PS=2.34u AD=243f PD=2.34u $ $x=-200 $y=-200 $w=400 $h=600
MNMOS_2 N_1 B GND GND NMOS W=270n L=180n AS=243f PS=2.34u AD=243f PD=2.34u $ $x=-200 $y=-1000 $w=400 $h=600
MPMOS_1 Y B Vdd Vdd PMOS W=810n L=180n AS=729f PS=3.42u AD=729f PD=3.42u $ $x=500 $y=700 $w=400 $h=600
MPMOS_2 Y A Vdd Vdd PMOS W=810n L=180n AS=729f PS=3.42u AD=729f PD=3.42u $ $x=-700 $y=700 $w=400 $h=600
Vdd Vdd Gnd 1.8
VA A Gnd pulse(0 1.8 0n 0.1n 0.1n 5n 10n)
VB B Gnd pulse(0 1.8 2.5n 0.1n 0.1n 5n 10n)

***Power Consumption***
.power Vdd

***Delay***
.measure tran delayA trig V(A) val=0.9 fall=1 targ V(Y) val=0.9 rise=1
.measure tran delayB trig V(B) val=0.9 rise=1 targ V(Y) val=0.9 fall=1



********* Simulation Settings - Analysis Section *********
.tran 0.1n 40n
********* Simulation Settings - Additional SPICE Commands *********
.print tran V(A) V(B) V(Y)
.end


