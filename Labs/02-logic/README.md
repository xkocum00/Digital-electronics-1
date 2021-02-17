# Lab 2: Combinational logic
## 1.Preparation tasks (done before the lab at home)

*Digital* or *Binary comparator* compares the digital signals A, B presented at input terminal and produce outputs depending upon the condition of those inputs. Complete the truth table for 2-bit *Identity comparator* (B equals A), and two *Magnitude comparators* (B is greater than A, B is less than A). Note that, such a digital device has four inputs and three outputs/functions.

| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** | 
| :-: | :-: | :-: | :-: | :-: | :-: | 
| 0 | 0 0 | 0 0 | 0 | 1 | 0 |  
| 1 | 0 0 | 0 1 | 0 | 0 | 1 |
| 2 | 0 0 | 1 0 | 0 | 0 | 1 |
| 3 | 0 0 | 1 1 | 0 | 0 | 1 |
| 4 | 0 1 | 0 0 | 1 | 0 | 0 |
| 5 | 0 1 | 0 1 | 0 | 1 | 0 |
| 6 | 0 1 | 1 0 | 0 | 0 | 1 |
| 7 | 0 1 | 1 1 | 0 | 0 | 1 |
| 8 | 1 0 | 0 0 | 1 | 0 | 0 |
| 9 | 1 0 | 0 1 | 1 | 0 | 0 |
| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
| 11 | 1 0 | 1 1 | 0 | 0 | 1 |
| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
| 14 | 1 1 | 1 0 | 1 | 0 | 0 |
| 15 | 1 1 | 1 1 | 0 | 1 | 0 |
 
**eq_sop** = (¬b1 * ¬b0 * ¬a1 * ¬a0) + (b1 * ¬b0 * a1 * ¬a0) + (¬b1 * b0 * ¬a1 * ¬a0) + (b1 * b0 * a1 * a0) ;
 
**bla_pos** = (b1 + b0 + a1 + a0) * (b1 + ¬b0 + a1 + a0) * (b1 + ¬b0 + a1 + ¬a0) * (¬b1 + b0 + a1 + a0) * (¬b1 + b0 + a1 + ¬a0) * 
            (¬b1 + b0 + ¬a1 + a0) * (¬b1 + ¬b0 + a1 + a0) * (¬b1 + ¬b0 + a1 + ¬a0) * (¬b1 + ¬b0 + ¬a1 + a0) * (¬b1 + ¬b0 + ¬a1 + ¬a0);

**bgta_pos** = (b1 + b0 + a1 + a0) * (b1 + b0 + a1 + ¬a0) * (b1 + b0 + ¬a1 + a0) * (b1 + b0 + ¬a1 + ¬a0) * (b1 + ¬b0 + a1 + ¬a0) * 
            (b1 + ¬b0 + ¬a1 + a0) * (b1 + ¬b0 + ¬a1 + ¬a0) * (¬b1 + b0 + ¬a1 + a0) * (¬b1 + b0 + ¬a1 + ¬a0) * (¬b1 + ¬b0 + ¬a1 + ¬a0);
## Part 2: A 2-bit comparator
### K-maps
Use K-maps to create a simplified SoP form of the "greater than" function and a PoS form of the "less than" function.

### Karnaugh map for B > A
<img src="IMAGES/AmensinezB.png" width="500">
<img src="IMAGES/1.png" width="300">

### Karnaugh map for A == B
<img src="IMAGES/ArovnoB.png" width="470">
<img src="IMAGES/2.png" width="500">

### Karnaugh map for A < B
<img src="IMAGES/AvetsinezB.png" width="480">
<img src="IMAGES/3.png" width="500">

## Part 3: A 4-bit binary comparator
## 4-bit comparator code design

```vhdl
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for 4-bit binary comparator
------------------------------------------------------------------------
entity comparator_4bit is
    port(
        a_i           : in  std_logic_vector(4 - 1 downto 0);
        b_i           : in  std_logic_vector(4 - 1 downto 0);


        -- COMPLETE ENTITY DECLARATION

        B_greater_A_o  : out std_logic;      -- B is greater than A
        B_equals_A_o   : out std_logic;		 -- B is equals than A
        B_less_A_o     : out std_logic       -- B is less than A
        
    );
end entity comparator_4bit;

------------------------------------------------------------------------
-- Architecture body for 4-bit binary comparator
------------------------------------------------------------------------
architecture Behavioral of comparator_4bit is
begin
    
    B_equals_A_o  <= '1' when (b_i > a_i) else '0';
    B_greater_A_o <= '1' when (b_i = a_i) else '0';
    B_less_A_o    <= '1' when (b_i < a_i) else '0';
    -- WRITE "GREATER" AND "EQUALS" ASSIGNMENTS HERE


end architecture Behavioral;
```

## 4-bit comparator test bench code testbench

```vhdl
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_comparator_4bit is
    -- Entity of testbench is always empty
end entity tb_comparator_4bit;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_comparator_4bit is

    -- Local signals
    signal s_a            : std_logic_vector(4 - 1 downto 0);
    signal s_b            : std_logic_vector(4 - 1 downto 0);
    signal s_B_greater_A  : std_logic;
    signal s_B_equals_A   : std_logic;
    signal s_B_less_A     : std_logic;

begin
    -- Connecting testbench signals with comparator_4bit entity (Unit Under Test)
    uut_comparator_4bit : entity work.comparator_4bit
        port map(
            a_i           => s_a,
            b_i           => s_b,
            B_greater_A_o => s_B_greater_A,
            B_equals_A_o  => s_B_equals_A,
            B_less_A_o    => s_B_less_A
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;


        -- First test values
        s_b <= "0000"; s_a <= "0000"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0000" severity error;
        
        -- First test values
        s_b <= "0000"; s_a <= "0001"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0001" severity error;
        
         -- First test values
        s_b <= "0000"; s_a <= "0010"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0010" severity error;
        
         -- First test values
        s_b <= "0000"; s_a <= "0011"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0011" severity error;
        
        
         -- First test values
        s_b <= "0000"; s_a <= "0100"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0100" severity error;
        
         -- First test values
        s_b <= "0000"; s_a <= "0101"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0101" severity error;
        
         -- First test values
        s_b <= "0000"; s_a <= "0110"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0110" severity error;
        
         -- First test values
        s_b <= "0000"; s_a <= "0111"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0111" severity error;
        
         -- First test values
        s_b <= "0000"; s_a <= "1000"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 1000" severity error;
        
         -- First test values
        s_b <= "0000"; s_a <= "1001"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 1001" severity error;
        
        -- WRITE OTHER TESTS HERE


        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
```
## Listing of simulator console output with reported error

```bash
[2021-02-17 13:30:59 EST] ghdl -i design.vhd testbench.vhd  && ghdl -m  tb_comparator_4bit && ghdl -r  tb_comparator_4bit   
analyze design.vhd
analyze testbench.vhd
elaborate tb_comparator_4bit
testbench.vhd:40:9:@0ms:(report note): Stimulus process started
testbench.vhd:46:9:@100ns:(assertion error): Test failed for input combination: 0000, 0000
testbench.vhd:60:9:@300ns:(assertion error): Test failed for input combination: 0000, 0010
testbench.vhd:82:9:@600ns:(assertion error): Test failed for input combination: 0000, 0101
testbench.vhd:96:9:@800ns:(assertion error): Test failed for input combination: 0000, 0111
testbench.vhd:118:9:@1us:(report note): Stimulus process finished
Done
```
[Link to public EDA Playground example] (https://www.edaplayground.com/x/8QrT)
