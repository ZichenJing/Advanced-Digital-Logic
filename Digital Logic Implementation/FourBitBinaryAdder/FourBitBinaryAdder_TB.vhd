--------------------------------------------------------------------------------
-- Company: NYU Abu Dhabi
-- Engineer: Andre, Sheena, Laial, Nancy
--
-- Create Date:   22:55:36 03/24/2025
-- Design Name:   Four Bit Binary Adder
-- Module Name:   T:/ADL/FourBitBinaryAdder/FourBitBinaryAdder_TB.vhd
-- Project Name:  FourBitBinaryAdder
-- Target Devices: FPGA
-- Tool versions:  Xilinx
--
-- Description: 
-- This code simulate a four bit binary adder that carry out calculations of two 4-bit binary numbers.
-- It takes two 4-bit inputs (A and B) and, may or may not, one STD_LOGIC input (CIN).
-- The output will be the result of the addition, 4-bit. With or without a carry output indicating the carry over. 
--
-- VHDL Test Bench Created by ISE for module: FourBitBinaryAdder
-- 
-- Dependencies:
-- Standard IEEE 1164 logic libraries
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench for the FourBitBinaryAdder
ENTITY FourBitBinaryAdder_TB IS
END FourBitBinaryAdder_TB;

ARCHITECTURE behavior OF FourBitBinaryAdder_TB IS 
 
	-- Component Declaration for the Unit Under Test (UUT)
	-- This declares the 4 bit binary adder component that will be tested
   COMPONENT FourBitBinaryAdder
   PORT(
		A : IN  std_logic_vector (3 downto 0);
      B : IN  std_logic_vector (3 downto 0);
      CIN : IN  std_logic;
      COUT : OUT  std_logic;
		S : OUT std_logic_vector (3 downto 0)
      );
	END COMPONENT;
    
	-- Declare signals to connect to the uut
   -- Inputs to the uut
   signal A_TB : std_logic_vector(3 downto 0) := (others => '0'); -- testbench input for A, initialized to 0000
   signal B_TB : std_logic_vector(3 downto 0) := (others => '0'); -- testbench input for B, initialized to 0000
   signal CIN_TB : std_logic := '0'; -- testbench carry input, initialized to 0
 
 	--Outputs
  signal COUT_TB : std_logic; -- carry output from the adder
  signal S_TB: std_logic_vector (3 downto 0); -- sum output from the adder

 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	-- This connects the signls to the FourBitBinaryAdder component
   uut: FourBitBinaryAdder PORT MAP (
			A => A_TB,
         B => B_TB,
         CIN => CIN_TB,
	  	   COUT => COUT_TB,
			S => S_TB
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
		-- Wait for 100 ns before applying the first set of inputs
      wait for 100 ns;

		-- Test case 1: A = 0000, B = 0000, CIN = 0
		-- Expected output: COUT = 0, S = 0000
      A_TB <= "0000";
		B_TB <= "0000";
		CIN_TB <= '0';
		wait for 100 ns;
		
		-- Test case 2: A = 0011, B = 0101, CIN = 0
		-- Expected output: COUT = 0, S = 1000
		A_TB <= "0011";
		B_TB <= "0101";
		CIN_TB <= '0';
		wait for 100 ns;
		
		-- Test case 3: A = 1100, B = 1101, CIN = 1
		-- Expected output: COUT = 1, S = 1010
		A_TB <= "1100";
		B_TB <= "1101";
		CIN_TB <= '1';
		wait for 100 ns;
		
		-- Test case 4: A = 1111, B = 1111, CIN = 0
		-- Expected output: COUT = 1, S = 1110
		A_TB <= "1111";
		B_TB <= "1111";
		CIN_TB <= '0';
		wait for 100 ns;
		
		-- Test case 5: A = 1111, B = 1111, CIN = 1
		-- Expected output: COUT = 1, S = 1111
		A_TB <= "1111";
		B_TB <= "1111";
		CIN_TB <= '1';
		wait for 100 ns;
		
		wait;
  
	end process;

END behavior;

