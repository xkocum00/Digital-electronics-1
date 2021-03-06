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
        
        -- TEST 0
        report "Testing 0 ..." severity note;
        s_hex <= "0000";
        wait for 10 ns;
        assert (s_seg = "0000001")
        report "Test failed for input combination: 0" severity error;
        
        -- TEST 1
        report "Testing 1 ..." severity note;
        s_hex <= "0001";
        wait for 10 ns;
        assert (s_seg = "1001111")
        report "Test failed for input combination: 1" severity error; 
        
        -- TEST 2
        report "Testing 2 ..." severity note;
        s_hex <= "0010";
        wait for 10 ns;
        assert (s_seg = "0010010")
        report "Test failed for input combination: 2" severity error; 
        
        -- TEST 3
        report "Testing 3 ..." severity note;
        s_hex <= "0011";
        wait for 10 ns;
        assert (s_seg = "0000110")
        report "Test failed for input combination: 3" severity error; 
        
        -- TEST 4
        report "Testing 4 ..." severity note;
        s_hex <= "0100";
        wait for 10 ns;
        assert (s_seg = "1001100")
        report "Test failed for input combination: 4" severity error; 
        
        -- TEST 5
        report "Testing 5 ..." severity note;
        s_hex <= "0101";
        wait for 10 ns;
        assert (s_seg = "0100100")
        report "Test failed for input combination: 5" severity error; 
        
        -- TEST 6
        report "Testing 6 ..." severity note;
        s_hex <= "0110";
        wait for 10 ns;
        assert (s_seg = "0100000")
        report "Test failed for input combination: 6" severity error; 
        
        -- TEST 7
        report "Testing 7 ..." severity note;
        s_hex <= "0111";
        wait for 10 ns;
        assert (s_seg = "0001111")
        report "Test failed for input combination: 7" severity error; 
        
        -- TEST 8
        report "Testing 8 ..." severity note;
        s_hex <= "1000";
        wait for 10 ns;
        assert (s_seg = "0000000")
        report "Test failed for input combination: 8" severity error; 
        
        -- TEST 9
        report "Testing 9 ..." severity note;
        s_hex <= "1001";
        wait for 10 ns;
        assert (s_seg = "0000100")
        report "Test failed for input combination: 9" severity error; 
        
        -- TEST 10 (A)
        report "Testing 10 ..." severity note;
        s_hex <= "1010";
        wait for 10 ns;
        assert (s_seg = "0001000")
        report "Test failed for input combination: 10" severity error; 
        
        -- TEST 11 (B)
        report "Testing 11 ..." severity note;
        s_hex <= "1011";
        wait for 10 ns;
        assert (s_seg = "1100000")
        report "Test failed for input combination: 11" severity error; 
        
        -- TEST 12 (C)
        report "Testing 12 ..." severity note;
        s_hex <= "1100";
        wait for 10 ns;
        assert (s_seg = "0110001")
        report "Test failed for input combination: 12" severity error; 
        
        -- TEST 13 (D)
        report "Testing 13 ..." severity note;
        s_hex <= "1101";
        wait for 10 ns;
        assert (s_seg = "1000010")
        report "Test failed for input combination: 13" severity error; 
        
        -- TEST 14 (E)
        report "Testing 14 ..." severity note;
        s_hex <= "1110";
        wait for 10 ns;
        assert (s_seg = "0110000")
        report "Test failed for input combination: 14" severity error;
        
        -- TEST 15 (F)
        report "Testing 15 ..." severity note;
        s_hex <= "1111";
        wait for 10 ns;
        assert (s_seg = "0111000")
        report "Test failed for input combination: 15" severity error;      
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished. ---------------------------------------" severity note;
        wait;       
    end process p_stimulus;
end Behavioral;