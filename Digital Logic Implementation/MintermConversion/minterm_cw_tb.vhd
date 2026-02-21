--------------------------------------------------------------------------------
-- Company: NYU Abu Dhabi
-- Engineer: Andre, Sheena, Laial, Nancy
--
-- Create Date:   22:59:37 03/24/2025
-- Design Name:   Minterms testbench
-- Module Name:   T:/sheena/ADL_Lab01_task4/minterm_cw_tb.vhd
-- Project Name:  ADL_Lab01_task4
-- Target Device:  FPGA
-- Tool versions:  Xilinx
-- Description:   
-- VHDL Test Bench Created by ISE for module: Minterms_CW
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: N/A
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
 
ENTITY minterm_cw_tb IS
END minterm_cw_tb;
 
ARCHITECTURE behavior OF minterm_cw_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
	COMPONENT Minterms_CW
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         D : IN  std_logic;
         O : OUT  std_logic
        );
    END COMPONENT;
    

   -- Signals for testing inputs/outputs for minterm function
	
   signal A_tb : std_logic := '0'; -- Test input for bit 3
   signal B_tb : std_logic := '0'; -- Test input for bit 2
   signal C_tb : std_logic := '0'; -- Test input for bit 1
   signal D_tb : std_logic := '0'; -- Test input for bit 0
   signal O_tb : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Minterms_CW PORT MAP (
          A => A_tb,
          B => B_tb,
          C => C_tb,
          D => D_tb,
          O => O_tb
        );

 --  Test Bench Statements to stimulate Minterms module
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes
		  
		  
		  -- Case 1: Stimulus for "0001"; Output O should be '1'
        A_tb <= '0';
		  B_tb <= '0';
		  C_tb <= '0';
		  D_tb <= '1';
		  wait for 100 ns;
		  
		  -- Case 2: Stimulus for "0011"; Output O should be '1'
        A_tb <= '0';
		  B_tb <= '0';
		  C_tb <= '1';
		  D_tb <= '1';
		  wait for 100 ns;
		  
		  -- Case 3: Stimulus for "1001"; Output O should be '1'
        A_tb <= '1';
		  B_tb <= '0';
		  C_tb <= '0';
		  D_tb <= '1';
		  wait for 100 ns;
		  
		  -- Case 4: Stimulus for "1011"; Output O should be '1'
        A_tb <= '1';
		  B_tb <= '0';
		  C_tb <= '1';
		  D_tb <= '1';
		  wait for 100 ns;
		  
		  -- Case 5: Stimulus for "0000"; Output O should be '0'
        A_tb <= '0';
		  B_tb <= '0';
		  C_tb <= '0';
		  D_tb <= '0';
		  wait for 100 ns;
		  
		  -- Case 6: Stimulus for "1111"; Output O should be '0'
        A_tb <= '1';
		  B_tb <= '1';
		  C_tb <= '1';
		  D_tb <= '1';
		  wait for 100 ns;
		  
		  -- Case 7: Stimulus for "1101"; Output O should be '0'
        A_tb <= '1';
		  B_tb <= '1';
		  C_tb <= '0';
		  D_tb <= '1';
		  wait for 100 ns;

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
