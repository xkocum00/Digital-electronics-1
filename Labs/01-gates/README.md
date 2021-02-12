# LAB 01-gates

### Link to GitHub repository
[GitHub repository](https://github.com/xkocum00/Digital-electronics-1.git)


## Part 3: EDA Playground

### De Morgan's laws
![Simulace De Morgan's LAW ](Images/demorganslaw.png)

| **c** | **b** |**a** | **f(c,b,a)** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 |


## Experiments on your own
### Boolean postulates
![ScrShot](Images/task11.png)
##### Link to EDA PlayGround
[EDA PlayGroud De Morgan](https://www.edaplayground.com/x/YqHa)

### VHDL Demorgans design.vhd
```------------------------------------------------------------------------
------------------------------------------------------------------------
--
-- Example of basic OR, AND, XOR gates.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        a_i     : in  std_logic;        -- Data input
        b_i     : in  std_logic;        -- Data input
        c_i	    : in  std_logic;		-- Data input
        
        
        
        --out Experiments on your own
        --Distributive laws
        dl1_o	: out std_logic;		-- out 1 
        dl2_o	: out std_logic;		-- out 2 
        dl3_o	: out std_logic;		-- out 3 
        dl4_o	: out std_logic			-- out 4 
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
    

     --task 2 Distributive laws
    dl1_o	<= (a_i and b_i) or (a_i and c_i);		--x*y + x*z
    dl2_o	<= a_i and (b_i or c_i);				--x * (y+z)
    dl3_o	<= (a_i or b_i) and (a_i or c_i);		--(x+y) * (x+z)
    dl4_o	<= a_i or (b_i and c_i);				--x + (y*z)

end architecture dataflow;


```
### Distributive laws
![ScrShot](Images/distributivelaws.png)



##### Link to EDA PlayGround
[EDA PlayGroud  distribuční zákony](https://www.edaplayground.com/x/PsfK)

### VHDL Distributive laws design.vhd
```
------------------------------------------------------------------------
--
-- Example of basic OR, AND, XOR gates.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        a_i     : in  std_logic;        -- Data input
        b_i     : in  std_logic;        -- Data input
        c_i	    : in  std_logic;		-- Data input
        
        for_o   : out std_logic;        -- OR output function
        fand_o  : out std_logic;        -- AND output function
        fxor_o  : out std_logic;        -- XOR output function
        
        fnor_o  : out std_logic;        -- NOR output function
        fnand_o : out std_logic;        -- NAND output function
        f_o 	: out std_logic;        -- De Morgan's Law output function
        --out Experiments on your own 
        --basic Boolean postulates
        x1_o	: out std_logic;		-- out 1 
        x2_o	: out std_logic;		-- out 2
        x3_o	: out std_logic;		-- out 3
        x4_o	: out std_logic 		-- out 4
        
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
    
    f_o			<= ((not b_i) and a_i) or ((not c_i) and (not b_i));						
    fnand_o 	<= not((not ((not b_i) and a_i)) and not((not c_i) and(not b_i)));		
    --nand
    fnor_o		<= (not(b_i or (not a_i))) or (not (c_i or b_i));						
    --nor
    
    --fand_o <= a_i and b_i;
    --fnor_o <= a_i xor b_i;
    --task 1 basic Boolean postulates
    x1_o	<= a_i and not(a_i);		--x*-x 	= 0
    x2_o	<= a_i or not(a_i);			--x+-x 	= 1
    x3_o	<= a_i or a_i or a_i;		--x+x+x = x
    x4_o	<= a_i and a_i and a_i;		--x*x*x = x
 

end architecture dataflow;

```



