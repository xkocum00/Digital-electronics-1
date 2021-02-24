# Lab 3: Introduction to Vivado

## Preparation tasks (done before the lab at home)

1. Follow the instructions for [Windows](https://github.com/tomas-fryza/Digital-electronics-1/wiki/How-to-Install-Vivado-2020.2-on-Windows) or [Linux](https://github.com/tomas-fryza/Digital-electronics-1/wiki/How-to-Install-Vivado-2020.1-on-Linux), download and install Vivado Design Suite.

2. The Nexys A7 board provides sixteen switches and LEDs. The switches can be used to provide inputs, and the LEDs can be used as output devices. See [schematic](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out the connection of slide switches and LEDs.
&nbsp;
## 1. Preparation tasks (done before the lab at home). Submit:
    * Figure or table with connection of 16 slide switches and 16 LEDs on Nexys A7 board.

&nbsp;
## 2. Two-bit wide 4-to-1 multiplexer. Submit:
### code design

```vhdl
------------------------------------------------------------------------
--
-- Example of 2-bit binary comparator using the when/else assignment.
-- EDA Playground
--
-- Copyright (c) 2020-2021 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for 2-bit binary comparator
------------------------------------------------------------------------
entity mux_2bit_4to1 is
    port(
        a_i           : in  std_logic_vector(2 - 1 downto 0);
        b_i           : in  std_logic_vector(2 - 1 downto 0);
        c_i           : in  std_logic_vector(2 - 1 downto 0);
        d_i           : in  std_logic_vector(2 - 1 downto 0);
        sel_i         : in  std_logic_vector(2 - 1 downto 0);
       
        f_o           : out std_logic_vector(2 - 1 downto 0)

        
        
    );
end entity mux_2bit_4to1;

------------------------------------------------------------------------
-- Architecture body for 2-bit binary comparator
------------------------------------------------------------------------
architecture Behavioral of mux_2bit_4to1 is
begin
    
    f_o <=  a_i when (sel_i = "00") else
            b_i when (sel_i = "01") else
            c_i when (sel_i = "10") else
            d_i; 


end architecture Behavioral;

```

### testbench

```vhdl
------------------------------------------------------------------------
--
-- Testbench for 2-bit binary comparator.
-- EDA Playground
--
-- Copyright (c) 2020-2021 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_mux_2bit_4to1 is
    -- Entity of testbench is always empty
end entity tb_mux_2bit_4to1;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_mux_2bit_4to1 is

    -- Local signals
    signal s_a            : std_logic_vector(2 - 1 downto 0);
    signal s_b            : std_logic_vector(2 - 1 downto 0);
    signal s_c            : std_logic_vector(2 - 1 downto 0);
    signal s_d            : std_logic_vector(2 - 1 downto 0);
    signal s_sel          : std_logic_vector(2 - 1 downto 0);
    
    signal s_f            : std_logic_vector(2 - 1 downto 0);

begin
    -- Connecting testbench signals with comparator_4bit entity (Unit Under Test)
    uut_mux_2bit_4to1 : entity work.mux_2bit_4to1
        port map(
            a_i           => s_a,
            b_i           => s_b,
            c_i           => s_c,
            d_i           => s_d,
            sel_i         => s_sel,
            f_o           => s_f
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;


        -- First test values
        s_d <= "00";s_c <= "00";s_b <= "00"; s_a <= "00"; 
        s_sel <= "00" ; wait for 10 ns;
        
        s_d <= "10";s_c <= "01";s_b <= "01"; s_a <= "00"; 
        s_sel <= "00" ; wait for 10 ns;
        
        s_d <= "10";s_c <= "01";s_b <= "01"; s_a <= "11"; 
        s_sel <= "00" ; wait for 10 ns;
        
        s_d <= "10";s_c <= "01";s_b <= "01"; s_a <= "00"; 
        s_sel <= "01" ; wait for 10 ns;
        
        s_d <= "10";s_c <= "01";s_b <= "11"; s_a <= "00"; 
        s_sel <= "01" ; wait for 10 ns;
        
        --s_d <= "10";s_c <= "01";s_b <= "11"; s_a <= "00"; 
        s_sel <= "10" ; wait for 10 ns;
        
        --s_d <= "10";s_c <= "01";s_b <= "11"; s_a <= "00"; 
        s_sel <= "11" ; wait for 10 ns;
        
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;

```


## simulated time waveforms
<img src="IMAGES/waveforms.png" >







    

## 3. A Vivado tutorial. Submit:
    * Your tutorial for Vivado design flow: project creation, adding source file, adding testbench file, running simulation, (adding XDC constraints file).

*Prepare all tasks in your README file `Digital-electronics-1/Labs/03-vivado/README.md`, [export/print it to PDF](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Export-MD-to-PDF), use [BUT e-learning](https://moodle.vutbr.cz/) web page and submit a single PDF file. The deadline for submitting the task is the day before the next laboratory exercise.*
