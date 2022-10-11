* SPICE export by:  S-Edit 16.01
* Export time:      Mon Feb 21 17:01:02 2022
* Design:           CMOS_NOR_194540
* Cell:             CMOS_NOR_194540
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
* Root path:        C:\Users\ishan\Documents\Tanner EDA\Tanner Tools v16.0\My_designs\CMOS_NOR_194540
* Exclude global pins:   no
* Exclude instance locations: no
* Control property name(s): SPICE

********* Simulation Settings - General Section *********

***** Top Level *****
***** Ishan Agarwal *****
.include "D:\NITH\6th Sem\VLSI Lab\Tanner_tool\model file\BPTM_Models files\180nm.md"
M1 Y A Gnd_ Gnd_ NMOS l=1.8e-007 w=2.7e-007 ad=1.2555e-013 as=2.268e-013 pd=1.08e-006 ps=1.98e-006  $ (2.7 -1.035 2.88 -0.765)
M2 Gnd_ B Y Gnd_ NMOS l=1.8e-007 w=2.7e-007 ad=2.268e-013 as=1.2555e-013 pd=1.98e-006 ps=1.08e-006  $ (3.51 -1.035 3.69 -0.765)
M3 1 A Vdd Vdd PMOS l=1.8e-007 w=8.1e-007 ad=2.5515e-013 as=4.0095e-013 pd=1.44e-006 ps=2.61e-006  $ (2.7 0.72 2.88 1.53)
M4 Y B 1 Vdd PMOS l=1.8e-007 w=8.1e-007 ad=4.0095e-013 as=2.5515e-013 pd=2.61e-006 ps=1.44e-006  $ (3.51 0.72 3.69 1.53)

vdd vdd Gnd_ 1.8
VA A Gnd_ pulse(0 1.8 0n 0.1n 0.1n 5n 10n)
VB B Gnd_ pulse(0 1.8 2.5n 0.1n 0.1n 5n 10n)
***Find Power***
.power vdd

***Measure Propagation Delay***
.measure tran delayA trig V(A) val=0.9 rise=1 targ V(Y) val=0.9 fall=1
.measure tran delayB trig V(B) val=0.9 fall=1 targ V(Y) val=0.9 rise=1



********* Simulation Settings - Analysis Section *********
.tran 0.1n 40n

********* Simulation Settings - Additional SPICE Commands *********
.print tran V(A) V(B) V(Y)
.end

