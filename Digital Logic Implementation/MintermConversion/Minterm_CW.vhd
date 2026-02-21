----------------------------------------------------------------------------------
-- Company: NYU Abu Dhabi
-- Engineer: Andre, Sheena, Laial, Nancy
-- 
-- Create Date :    22:51:43 03/24/2025 
-- Design Name:    Minterm Function
-- Module Name:    Minterm_CW - Behavioral
-- Project Name:   ADL Task 4 - Minterm Using Case-When
-- Target Devices: FPGA 
-- Tool versions:  Xilinx
-- Description: 
-- This code uses case-when assignment to implement a Minterms function.
-- It takes four STD_LOGIC inputs (A, B, C, D).
-- The output O is "1" for the minterms "0001", "0011", "1001", and "1011" (where "ABCD")

-- Dependencies: 
-- Standard IEEE 1164 logic libraries.
--
--
-- Additional Comments: N/A
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for the minterm-based function
entity Minterms_CW is
    Port ( 
        A : in  STD_LOGIC;  -- Bit 3 (MSB)
        B : in  STD_LOGIC;  -- Bit 2
        C : in  STD_LOGIC;  -- Bit 1
        D : in  STD_LOGIC;  -- Bit 0 (LSB)
        O : out STD_LOGIC
    );
end Minterms_CW;


-- Architecture definition for minterm-based function
architecture Behavioral of Minterms_CW is

-- Creating 4-bit vector for evaluation
signal input_vector : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin

	input_vector <= A & B & C & D; -- Concatenating A, B, C, D to form 4-bit vector

    -- Process block to evaluate O based on input ABDC
    process(input_vector)

    begin

        case input_vector is
            when "0001" =>  -- Minterm of binary value 1 (A=0, B=0, C=0, D=1)
                O <= '1';
            when "0011" =>  -- Minterm of binary value 3 (A=0, B=0, C=1, D=1)
                O <= '1';
            when "1001" =>  -- Minterm of binary value 9 (A=1, B=0, C=0, D=1)
                O <= '1';
            when "1011" =>  -- Minterm of binary value 11 (A=1, B=0, C=1, D=1)
                O <= '1';
            when others =>
                O <= '0';   -- Default case , where output O='0' for all other inputs
        end case;
    end process;

end Behavioral;

