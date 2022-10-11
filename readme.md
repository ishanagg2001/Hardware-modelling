## Why we use Verilog ?

### **To describe digital system as a set of modules**
> *Each module have interface to the other modules, in addition to its description.*

*The modules are interconnected using nets, which allows them to work with each other.*

### After specifiying the system in Verilog, we can do two things :-

>**Simulate the system** and Verify the operation just like running a program in some high level language.

*For simulation we require **test bench** or **test harness** that specifies the input are to be applied and way output are to be displayed.*

>Use a **Synthesis tool** to map it on real Hardware like **FPGA OR ASIC.**

## How to Simulate Verilog Module(s) ?

Using a **Testbench** to verify the functionality of the Design coded in Verilog called Design Under Test **(DUT)** which comprises of :-

- a set of stimulus for **DUT** (Design Under Test).
- a monitor, which captures or analyze the output of DUT.

#### **Requirement** - *The input and output need to be connected to the testbench.*

### What is Verilog ?
>*Verilog, standardized as IEEE 1364, is a hardware description language (HDL) used to model electronic systems.*
>*Verilog is intended to be used for verification through simulation, for timing analysis, for test analysis (testability analysis and fault grading) and for logic synthesis.*

### What is VHDL ?
>*The VHSIC Hardware Description Language (VHDL) is a hardware description language (HDL) that can model the behavior and structure of digital systems at multiple levels of abstraction, ranging from the system level down to that of logic gates, for design entry, documentation, and verification purposes.*

### What is Tannner ?
>*Tanner EDA is a suite of tools for the design of integrated circuits. These tools allow you to enter. schematics, perform SPICE simulations, do physical design (i.e., chip layout), and perform design rule. checks (DRC) and layout versus schematic (LVS) checks.*

### How do you install Tanner?
>*Open your downloads folder and double click on the application file you just downloaded.
Select Install Products and keep the default download location and press Next.
Both products should be slected. ...
Accept the License Agreement and Click Install.*
