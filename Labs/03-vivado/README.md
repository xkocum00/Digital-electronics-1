# Lab 3: Introduction to Vivado

## Preparation tasks (done before the lab at home)

1. Follow the instructions for [Windows](https://github.com/tomas-fryza/Digital-electronics-1/wiki/How-to-Install-Vivado-2020.2-on-Windows) or [Linux](https://github.com/tomas-fryza/Digital-electronics-1/wiki/How-to-Install-Vivado-2020.1-on-Linux), download and install Vivado Design Suite.

2. The Nexys A7 board provides sixteen switches and LEDs. The switches can be used to provide inputs, and the LEDs can be used as output devices. See [schematic](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out the connection of slide switches and LEDs.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;


## Part 1: Synchronize Git and create a new folder

Run Git Bash (Windows) of Terminal (Linux), navigate to your working directory, and update local repository. 

```bash
## Windows Git Bash:
$ cd d:/Documents/
$ cd your-name/
$ ls
Digital-electronics-1/
$ cd Digital-electronics-1/
$ git pull


## Linux:
$ cd
$ cd Documents/
$ cd your-name/
$ ls
Digital-electronics-1/
$ cd Digital-electronics-1/
$ git pull
```

Create a new working folder `Labs/03-vivado` for this exercise.

```bash
## Windows Git Bash or Linux:
$ cd Labs/
$ mkdir 03-vivado
```


## Part 2: Project creation in Vivado

Get inspired by the [Creating and Programming our First FPGA Project Part 2: Initial Project Creation](https://blog.digilentinc.com/creating-and-programming-our-first-fpga-project-part-2-initial-project-creation/) tutorial and create a new project in Vivado (Set location to your `Labs/03-vivado` working folder). Unlike the instructions, let your project contains:
   * VHDL source file: `comparator_2bit` (the same file name as the entity)
   * Created constraints XDC file: `nexys-a7-50t`
   * Default board : `Nexys A7-50T`

Copy/paste your EDA Playground `design.vhd` code from the previous exercise to `comparator_2bit.vhd` source file.

Use **File** > **Add Sources Alt+A** > **Add or create simulation sources** and create a new VHDL file `tb_comparator_2bit` (same filename as tested entity with prefix `tb_`). Copy/pase your EDA Playground `testbench.vhd` code from previous exercise to `tb_comparator_2bit.vhd` file.

Use **Flow** > **Run Simulation** > **Run Behavioral Simulation** and run Vivado simulator.

The Nexys A7 board have hardwired connections between FPGA chip and the switches and LEDs. To use these devices it is necessary to include in your project the correct pin assignments. Copy/paste constraints from [Nexys-A7-50T-Master.xdc](https://github.com/Digilent/digilent-xdc) to `nexys-a7-50t.xdc` file. The pin assignments in the file are useful only if the pin names that appear in this file are exactly the same as the port names used in your VHDL entity.

Get inspired by the [Creating and Programming our First FPGA Project Part 4](https://blog.digilentinc.com/creating-and-programming-our-first-fpga-project-part-4/) tutorial, compile and download circuit into the FPGA chip.


## Part 3: Multiplexer

A multiplexer (MUX) is a device that has multiple inputs and a single line output. The select lines determine which input is connected to the output. Consider a circuit in which the 2-bit output f_o[1:0] has to be selected from four 2-bit inputs a_i[1:0], b_i[1:0], c_i[1:0], and d_i[1:0]. The circuit uses a 2-bit select input sel_i[1:0] and implements the following truth table.

| **Select sel_i[1:0]** | **Output f_o[1:0]** |
| :-: | :-: |
| 0 0 | a_i[1:0] |
| 0 1 | b_i[1:0] |
| 1 0 | c_i[1:0] |
| 1 1 | d_i[1:0] |

![Circuit symbol for two-bit wide 4-to-1 multiplexer](Images/mux_4to1.png)

Perform the following steps to implement the two-bit wide 4-to-1 multiplexer. Take screenshots and make your own README tutorial on how to create a Vivado project, how to run a simulation and how to program an FPGA on board Nexys A7.

   1. Create a new Vivado project for your circuit.
   2. Create a VHDL entity `mux_2bit_4to1` for the two-bit wide 4-to-1 multiplexer.
   3. Complete a VHDL architecture using the [conditional signal assignment](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Signal-assignments) `when`, `else` (outside process).
   4. Create a testbench `tb_mux_2bit_4to1` and simulate the circuit.
   5. Make pin assignments for the Nexys A7 board in `nexys-a7-50t.xdc`: connect mux select inputs sel_i[1:0] to slide switches SW[15:14] and use switches SW[7:0] to provide the four inputs a_i[1:0] to d_i[1:0]. Connect output f_o[1:0] to LEDs LD[15:14].
   6. Compile the project and download the generated bitstream into the FPGA chip.
   7. Test the functionality of the two-bit wide 4-to-1 multiplexer by toggling the switches and observing the LEDs.


## Synchronize repositories

Use [git commands](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Git-useful-commands) to add, commit, and push all local changes to your remote repository. Check the repository at GitHub web page for changes.


## Experiments on your own

1. Complete your own tutorial for Vivado design flow in `Labs/03-vivado/README.md` file.


## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
    * Figure or table with connection of 16 slide switches and 16 LEDs on Nexys A7 board.

2. Two-bit wide 4-to-1 multiplexer. Submit:
    * Listing of VHDL architecture from source file `mux_2bit_4to1.vhd` with syntax highlighting,
    * Listing of VHDL stimulus process from testbench file `tb_mux_2bit_4to1.vhd` with syntax highlighting,
    * Screenshot with simulated time waveforms; always put all inputs and outputs.

3. A Vivado tutorial. Submit:
    * Your tutorial for Vivado design flow: project creation, adding source file, adding testbench file, running simulation, (adding XDC constraints file).

*Prepare all tasks in your README file `Digital-electronics-1/Labs/03-vivado/README.md`, [export/print it to PDF](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Export-MD-to-PDF), use [BUT e-learning](https://moodle.vutbr.cz/) web page and submit a single PDF file. The deadline for submitting the task is the day before the next laboratory exercise.*
