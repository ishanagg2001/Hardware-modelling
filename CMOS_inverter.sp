* SPICE export by:  S-Edit 16.01
* Export time:      Fri Feb 18 19:17:07 2022
* Design:           CMOS_inverter
* Cell:             CMOS_inverter
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
* Root path:        C:\Users\ishan\Documents\Tanner EDA\Tanner Tools v16.0\My_designs\CMOS_inverter
* Exclude global pins:   no
* Exclude instance locations: no
* Control property name(s): SPICE

********* Simulation Settings - General Section *********

***** Top Level *****
.include "D:\NITH\6th Sem\VLSI Lab\Tanner_tool\model file\BPTM_Models files\180nm.md"

MNMOS_1 Out In Gnd Gnd NMOS W=270n L=180n AS=243f PS=2.34u AD=243f PD=2.34u $ $x=-300 $y=100 $w=400 $h=600
MPMOS_1 Out In Vdd Vdd PMOS W=810n L=180n AS=729f PS=3.42u AD=729f PD=3.42u $ $x=-300 $y=800 $w=400 $h=600

Vdd Vdd Gnd 5
Vin In Gnd

********* Simulation Settings - Analysis Section *********
.dc Vin 0 5 0.1

********* Simulation Settings - Additional SPICE Commands *********
.print dc V(In) V(Out)
.end

