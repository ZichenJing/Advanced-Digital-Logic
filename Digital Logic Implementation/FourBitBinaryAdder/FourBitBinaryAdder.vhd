----------------------------------------------------------------------------------
-- Company: NYU Abu Dhabi
-- Engineer: Andre, Sheena, Laial, Nancy
-- 
-- Create Date:    22:54:48 03/24/2025 
-- Design Name:    Four Bit Binary Adder
-- Module Name:    FourBitBinaryAdder - Behavioral 
-- Project Name:   ADL Task 3 - Four Bit Binary Adder
-- Target Devices: FPGA
-- Tool versions:  Xilinx
--
-- Description: 
-- This code simulate a four bit binary adder that carry out calculations of two 4-bit binary numbers.
-- It takes two 4-bit inputs (A and B) and, may or may not, one STD_LOGIC input (CIN).
-- The output will be the result of the addition, 4-bit. With or without a carry output indicating the carry over. 
--
-- Dependencies: 
-- Standard IEEE 1164 logic libraries
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaration for a full adder
entity fulladder is
	Port ( A : in  STD_LOGIC; -- first input bit
          B : in  STD_LOGIC; -- second input bit 
          CIN : in  STD_LOGIC; -- carry input bit from the previous stage
          COUT : out  STD_LOGIC; -- carry output bit to the next stage
          S : out  STD_LOGIC -- sum of A, B, and CIN
		   ); 
end fulladder;

-- Behavioral architecture of the full adder
architecture Behavioral of fulladder is
begin
	S <= A xor B xor CIN; -- calculate the sum
	COUT <= (A and B) or (CIN and (A xor B)); -- calculate the carry output
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaration for the 4 bit binary adder
entity FourBitBinaryAdder is
	Port ( A : in  STD_LOGIC_VECTOR (3 downto 0); -- 4 bit input vector A
          B : in  STD_LOGIC_VECTOR (3 downto 0); -- 4 bit input vector B
          CIN : in  STD_LOGIC; -- carry input bit
		    COUT : out  STD_LOGIC; -- carry output bit 
          S : out  STD_LOGIC_VECTOR (3 downto 0) -- 4 bit sum output vector S
		  );
end FourBitBinaryAdder;

-- Behavioral architecture of the 4 bit binary adder
architecture Behavioral of FourBitBinaryAdder is
-- Declare a component for the full adder to be used in the 4 bit adder
	component fulladder
		Port ( A : in  STD_LOGIC;
				 B : in  STD_LOGIC;
             CIN : in  STD_LOGIC;
             COUT : out  STD_LOGIC;
             S : out  STD_LOGIC);
	end component;
	
-- Intermediate carry signals between the full adders used within the 4 bit adder 
	signal C1, C2, C3: STD_LOGIC;
	
begin
	-- Create a full adder for each bit of the 4 bit adder
	FA0: fulladder port map(A(0), B(0), CIN, C1, S(0)); -- add bit 0 with carry input
	FA1: fulladder port map(A(1), B(1), C1, C2, S(1)); -- add bit 1 with carry output from the previous adder
	FA2: fulladder port map(A(2), B(2), C2, C3, S(2)); -- add bit 2 with carry output from the previous adder
	FA3: fulladder port map(A(3), B(3), C3, COUT, S(3)); -- add bit 3 with carry output to the final output
end Behavioral;

