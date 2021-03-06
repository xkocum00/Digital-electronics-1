----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2021 09:36:19
-- Design Name: 
-- Module Name: tb_hex_7seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_hex_7seg is
--  Port ( );
end tb_hex_7seg;

architecture Behavioral of tb_hex_7seg is
    signal s_hex            : std_logic_vector(4 - 1 downto 0);
    signal s_seg            : std_logic_vector(7 - 1 downto 0);

    
begin

 -- Connecting testbench signals with comparator_4bit entity (Unit Under Test)
    uut_hex_7seg : entity work.hex_7seg
        port map(
            hex_i           => s_hex,
            seg_o           => s_seg
        );



    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started. ---------------------------------------" severity note;
        
        s_hex <= "0000";    wait for 10 ns;       -- 0
        
        s_hex <= "0001";    wait for 10 ns;       -- 1
        
        s_hex <= "0010";    wait for 10 ns;       -- 2
        
        s_hex <= "0011";    wait for 10 ns;       -- 3
        
        s_hex <= "0100";    wait for 10 ns;       -- 4
        
        s_hex <= "0101";    wait for 10 ns;       -- 5
        
        s_hex <= "0110";    wait for 10 ns;       -- 6
        
        s_hex <= "0111";    wait for 10 ns;       -- 7
        
        s_hex <= "1000";    wait for 10 ns;       -- 8
        
        s_hex <= "1001";    wait for 10 ns;       -- 9
        
        s_hex <= "1010";    wait for 10 ns;       -- A
        
        s_hex <= "1011";    wait for 10 ns;       -- B
        
        s_hex <= "1100";    wait for 10 ns;       -- C
        
        s_hex <= "1101";    wait for 10 ns;       -- D
        
        s_hex <= "1110";    wait for 10 ns;       -- E
        
        s_hex <= "1111";    wait for 10 ns;       -- F      
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished. ---------------------------------------" severity note;
        wait;       
    end process p_stimulus;
end Behavioral;