# Lab 7: Latches and Flip-flops

### Learning objectives

## Preparation tasks (done before the lab at home)

Write characteristic equations and complete truth tables for D, JK, T flip-flops where `q(n)` represents main output value before the clock edge and `q(n+1)` represents value after the clock edge.

   
   ![rce](IMAGES/1.png)
   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](IMAGES/eq_uparrow.png) | 0 | 0 | 0  | no change |
   | ![rising](IMAGES/eq_uparrow.png) | 0 | 1 | 0 | change |
   | ![rising](IMAGES/eq_uparrow.png) | 1 | 0 | 1 | change |
   | ![rising](IMAGES/eq_uparrow.png) | 1 | 1 | 1 | no change |
   
   ![rce](IMAGES/2.png)
   
   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | ![rising](IMAGES/eq_uparrow.png) | 0 | 0 | 0 | 0 | No change |
   | ![rising](IMAGES/eq_uparrow.png) | 0 | 0 | 1 | 1 | No change |
   | ![rising](IMAGES/eq_uparrow.png) | 0 | 1 | 0 | 0 | reset |
   | ![rising](IMAGES/eq_uparrow.png) | 0 | 1 | 1 | 0 | reset |
   | ![rising](IMAGES/eq_uparrow.png) | 1 | 0 | 0 | 1 | set |
   | ![rising](IMAGES/eq_uparrow.png) | 1 | 0 | 1 | 1 | set |
   | ![rising](IMAGES/eq_uparrow.png) | 1 | 1 | 0 | 1 | toggle |
   | ![rising](IMAGES/eq_uparrow.png) | 1 | 1 | 1 | 0 | toggle |
   
   ![rce](IMAGES/3.png)
   
   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](IMAGES/eq_uparrow.png) | 0 | 0 | 0 | no change |
   | ![rising](IMAGES/eq_uparrow.png) | 0 | 1 | 1 | no change |
   | ![rising](IMAGES/eq_uparrow.png) | 1 | 0 | 1 | toggle |
   | ![rising](IMAGES/eq_uparrow.png) | 1 | 1 | 0 | toggle |



## Part 2: VHDL code for D latch

<!--
TODO: Popis co je to Latch.
-->
A latch is a level triggered element. Perform the following steps to model the D latch circuit.

   1. Create a new Vivado RTL project `flip_flops` in your `Labs/07-ffs` working folder.
   2. Create a VHDL source file `d_latch` for D latch circuit.
   3. Choose default board: `Nexys A7-50T`.
   4. Define entity with `en`, `arst`, `d`, `q`, `q_bar`, use example from lecture and complete the latch with asynchronous reset.
   5. Create a simulation source `tb_d_latch`, set input conditions and run the simulation. Verify the reset and enable functionality.


## Part 3: VHDL code for flip-flops

Create entities for D flip-flop (with an async reset, with a sync reset), JK flip-flop (with a sync reset), T flip-flop (with a sync reset) and simulate each entity separately.

   | **Entity** | **Inputs** | **Outputs** | **Description** |
   | :-- | :-- | :-- | :-- |
   | `d_ff_arst` | `clk`, `arst`, `d` | `q`, `q_bar` | D type flip-flop with an async reset |
   | `d_ff_rst` | `clk`, `rst`, `d` | `q`, `q_bar` | D type flip-flop with a sync reset |
   | `jk_ff_rst` | `clk`, `rst`, `j`, `k` | `q`, `q_bar` | JK type flip-flop with a sync reset |
   | `t_ff_rst` | `clk`, `rst`, `t` | `q`, `q_bar` | T type flip-flop with a sync reset |


## Synchronize repositories

Use [git commands](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Useful-Git-commands) to add, commit, and push all local changes to your remote repository. Check the repository at GitHub web page for changes.


## Experiments on your own: Shift register

Use D type flip-flops with synchronous reset and perform the following steps to implement the 4-bit shift register on the Nexys A7 board.

   1. Create a new design source `top` in your project.
   2. Use **Define Module** dialog and define I/O ports of entity `top` as follows.

   | **Port name** | **Direction** | **Type** | **Description** |
   | :-: | :-: | :-- | :-- |
   | `BTNU` | in | `std_logic` | Clock emulator |
   | `BTNC` | in | `std_logic` | Synchronous reset |
   | `SW` | in  | `std_logic_vector(1 - 1 downto 0)` | Shift register serial input |
   | `LED` | out | `std_logic_vector(4 - 1 downto 0)` | Shift register parallel outputs |

   3. Use direct instantiation and define an architecture of the top level.

```vhdl
------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

    -- Internal signals between flip-flops
    -- WRITE YOUR CODE HERE

begin

    --------------------------------------------------------------------
    -- Four instances (copies) of D type FF entity
    d_ff_0 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            -- WRITE YOUR CODE HERE
        );

    d_ff_1 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            -- WRITE YOUR CODE HERE
        );

    -- WRITE YOUR CODE HERE

end architecture Behavioral;
```

   4. Create a testbench file `tb_top` and simulate it or create a new [constraints XDC](https://github.com/Digilent/digilent-xdc/blob/master/Nexys-A7-50T-Master.xdc) file: `nexys-a7-50t` and uncomment used pins according to the entity.
   5. Compile the project and download the generated bitstream `flip_flops/flip_flops.runs/impl_1/top.bit` into the FPGA chip.
   6. Test the functionality of the shift register by pressing the push buttons and observing LEDs.
   7. Use **IMPLEMENTATION > Open Implemented Design > Schematic** to see the generated structure.


## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
    * Characteristic equations and completed tables for D, JK, T flip-flops.

2. D latch. Submit:
    * VHDL code listing of the process `p_d_latch` with syntax highlighting,
    * Listing of VHDL reset and stimulus processes from the testbench `tb_d_latch.vhd` file with syntax highlighting and asserts,
    * Screenshot with simulated time waveforms; always display all inputs and outputs. The full functionality of the entity must be verified.

3. Flip-flops. Submit:
    * VHDL code listing of the processes `p_d_ff_arst`, `p_d_ff_rst`, `p_jk_ff_rst`, `p_t_ff_rst` with syntax highlighting,
    * Listing of VHDL clock, reset and stimulus processes from the testbench files with syntax highlighting and asserts,
    * Screenshot with simulated time waveforms; always display all inputs and outputs. The full functionality of the entities must be verified.

4. Shift register. Submit:
    * Image of the shift register schematic. The image can be drawn on a computer or by hand. Name all inputs, outputs, components and internal signals.

*Prepare all parts of the assignment on a computer (not by hand), insert them in your README file `Digital-electronics-1/Labs/07-ffs/README.md`, export the formated output (not the listing in markdown language) from [HTML to PDF](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Export-README-to-PDF), use [BUT e-learning](https://moodle.vutbr.cz/) web page and submit a single PDF file. The deadline for submitting the task is the day before the next laboratory exercise.*
