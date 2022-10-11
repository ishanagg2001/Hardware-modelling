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

### What is verilog ?
>*Verilog, standardized as IEEE 1364, is a hardware description language (HDL) used to model electronic systems.*

### What is VHDL ?
>*The VHSIC Hardware Description Language (VHDL) is a hardware description language (HDL) that can model the behavior and structure of digital systems at multiple levels of abstraction*
