* 194558 Mukul Goyal
* CMOS NOR minimum x1 dimension
* SPICE export by:  S-Edit 16.01
* Export time:      Thu Mar 17 22:54:41 2022
* Design:           CMOS_NOR_3Input
* Cell:             Cell0 * Interface:        view0
* View:             view0 * View type:        connectivity* Export as:        top-level cell
* Export mode:      hierarchical
* Exclude empty cells: yes
* Exclude .model:   no * Exclude .end:     noc* Exclude simulator commands:     no* Expand paths:     yes
* Wrap lines:       no
* Root path:        C:\Users\Mukul Goyal\Desktop\SPICE_Simulation\CMOS_NOR_3Input* Exclude global pins:   no * Exclude instance locations: no * Control property name(s): SPICE

********* Simulation Settings - General Section *********
.include "D:\Tanner_tool\model file\BPTM_Models files\180nm.md"

***** Top Level *****
MNMOS_1 Y A Gnd Gnd NMOS W=270n L=180n AS=243f PS=2.34u AD=243f PD=2.34u $ $x=-400 $y=400 $w=400 $h=600
MNMOS_2 Y B Gnd Gnd NMOS W=270n L=180n AS=243f PS=2.34u AD=243f PD=2.34u $ $x=800 $y=400 $w=400 $h=600
MNMOS_3 Y C_In Gnd Gnd NMOS W=270n L=180n AS=243f PS=2.34u AD=243f PD=2.34u $ $x=2200 $y=400 $w=400 $h=600
MPMOS_1 N_1 A Vdd Vdd PMOS W=810n L=180n AS=729f PS=3.42u AD=729f PD=3.42u $ $x=1100 $y=2800 $w=400 $h=600
MPMOS_2 N_2 B N_1 Vdd PMOS W=810n L=180n AS=729f PS=3.42u AD=729f PD=3.42u $ $x=1100 $y=2000 $w=400 $h=600
MPMOS_3 Y C_In N_2 Vdd PMOS W=810n L=180n AS=729f PS=3.42u AD=729f PD=3.42u $ $x=1100 $y=1200 $w=400 $h=600

Vdd Vdd Gnd 1.8

VA A Gnd Pulse(0 1.8 0 0.1n 0.1n 5n 10n)
VB B Gnd Pulse(0 1.8 2n 0.1n 0.1n 5n 10n)
VC C_In Gnd Pulse(0 1.8 3n 0.1n 0.1n 5n 10n)

********* Simulation Settings - Analysis Section *********
.tran 0.1n 40n
********* Power Measurement**********
.power Vdd
********* Delay Measurement *********
.measure tran DelayA trig V(A) val=0.9 rise=1 targ V(Y) val=0.9 fall=1
.measure tran DelayB trig V(B) val=0.9 fall=1 targ V(Y) val=0.9 rise=1
.measure tran DelayC trig V(C_In) val=0.9 fall=1 targ V(Y) val=0.9 rise=1
.print V(A) V(B) V(C_In) V(Y)
.end


