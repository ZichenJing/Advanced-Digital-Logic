----------------------------------------------------------------------------------
-- Company: NYU Abu Dhabi
-- Engineer: Andre, Sheena, Laial, Nancy
-- 
-- Create Date:    14:46:38 03/24/2025 
-- Design Name: 	Minterm Function
-- Module Name:    task4_CSA - Behavioral 
-- Project Name: 	 ADL Task 4 - Minterm Using CSA
-- Target Devices: FPGA 
-- Tool versions: Xilinx
-- Description: 
-- This code implements a Minterms function directly using concurrent signal assignment.
-- It takes four STD_LOGIC inputs (A, B, C, D).
-- The output O is "1" for the minterms "0001", "0011", "1001", and "1011" (where "ABCD")

--
-- Dependencies: 
-- Standard IEEE 1164 logic libraries.
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: N/A
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for function
entity Minterms_CSA is
    Port (
        A : in  STD_LOGIC;  -- Bit 3 (MSB)
        B : in  STD_LOGIC;  -- Bit 2
        C : in  STD_LOGIC;  -- Bit 1
        D : in  STD_LOGIC;  -- Bit 0 (LSB)
        O : out STD_LOGIC
	);
end Minterms_CSA;

-- Architecture definition for minterm-based function
architecture Behavioral of Minterms_CSA is
begin
     O <= '1' when ((A = '0') and (B = '0') and (C = '0') and (D = '1')) else -- For minterm 1 = "0001"
         '1' when ((A = '0') and (B = '0') and (C = '1') and (D = '1')) else -- For minterm 3 = "0011"
         '1' when ((A = '1') and (B = '0') and (C = '0') and (D = '1')) else -- For minterm 9 = "1001"
         '1' when ((A = '1') and (B = '0') and (C = '1') and (D = '1')) else -- For minterm 11 = "1011"
         '0'; -- Default case, where output O='0' for all other minterms
end Behavioral;


