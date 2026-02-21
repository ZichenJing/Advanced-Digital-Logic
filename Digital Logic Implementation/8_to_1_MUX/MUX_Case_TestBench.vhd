--------------------------------------------------------------------------------
-- Company: NYU Abu Dhabi
-- Engineer: Andre Llaneta, Sheena Chiang, Nancy Jing, Laial Saad
--
-- Create Date:   15:22:47 03/24/2025
-- Design Name:   MUX_Case_TestBench
-- Module Name:   /home/adld/Lab1_Task5/MUX_Case_TestBench.vhd
-- Project Name:  Lab1_Task5
-- Target Device: FPGA 
-- Tool versions:  Xilinx	
-- Description:   Testing MUX_Case
-- 
-- VHDL Test Bench Created by ISE for module: mux_switch_case
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MUX_Case_TestBench IS
END MUX_Case_TestBench;
 
ARCHITECTURE behavior OF MUX_Case_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_switch_case
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(2 downto 0);
         O : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A_tb : std_logic_vector(7 downto 0) := (others => '0');
   signal B_tb : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal O_tb : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_switch_case PORT MAP (
		 A => A_tb,
		 B => B_tb,
		 O => O_tb
	);

	stim_proc: process
   begin
		wait for 100 ns;
		
		-- Test Case 1: Select bit 5 from A (B = "101")
		A_tb <= "00100000"; B_tb <= "101"; -- Onlt Bit 5 is 1
		wait for 100 ns;
		
		-- Test Case 2: Select bit 3 from A (B = "011")
		A_tb <= "11110111"; B_tb <= "011"; -- Onlt Bit 3 is 0
		wait for 100 ns;
		
		-- Test Case 3: Select bit 7 from A (B = "111")
		A_tb <= "10000000"; B_tb <= "111"; -- Onlt Bit 7 is 1
		wait for 100 ns;
		
		-- Test Case 4: Select bit 0 from A (B = "000")
		A_tb <= "11111110"; B_tb <= "000"; -- Onlt Bit 0 is 0
		wait for 100 ns;
		
		-- Test Case 5: Select bit 6 from A (B = "110")
		A_tb <= "01000000"; B_tb <= "110"; -- Onlt Bit 6 is 1
		wait for 100 ns;
		
		-- Test Case 6: Select bit 6 from A (B = "110")
		A_tb <= "10111111"; B_tb <= "110"; -- Onlt Bit 6 is 0
		wait for 100 ns;
		
		-- Test Case 7: Select bit 1 from A (B = "001")
		A_tb <= "00000010"; B_tb <= "001"; -- Onlt Bit 1 is 1
		wait for 100 ns;
		
		-- Test Case 8: Select bit 0 from A (B = "000")
		A_tb <= "00000001"; B_tb <= "000"; -- Onlt Bit 0 is 1
		wait for 100 ns;
		
		-- Test Case 9: Select bit 4 from A (B = "100")
		A_tb <= "00010000"; B_tb <= "100"; -- Onlt Bit 4 is 1
		wait for 100 ns;
		
		A_tb <= "XXXXXXXX"; B_tb <= "XXX";
		wait;
		
   end process;
END;



