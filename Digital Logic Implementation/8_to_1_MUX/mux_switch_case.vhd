----------------------------------------------------------------------------------
-- Company: NYU Abu Dhabi ADL Lab	
-- Engineer: Andre Llaneta, Laial Saad, Sheena Chiang, Nancy Jing
-- 
-- Create Date:    14:50:41 03/24/2025 
-- Design Name: Lab1_8to1Mux
-- Module Name:    mux_switch - Behavioral 
-- Project Name: Lab1_MuxSwitch
-- Target Devices: FPGA	
-- Tool versions: Xilinx
-- Description: This VHDL module selects one of 8 outputs (A) based
-- on the 3 bit inout select (B) ang routes the input that was selected to output (O)
--
-- Dependencies: Standard IEEE 1164 logic libraries
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_switch_case is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (2 downto 0);
           O : out  STD_LOGIC);
end mux_switch_case;

architecture Behavioral of mux_switch_case is
begin

-- CASE
--	process (B, A)
--	begin
--		case B is
--			when "000" =>
--				O <= A(0);
--			when "001" =>
--				O <= A(1);
--			when "010" =>
--				O <= A(2);
--			when "011" =>
--				O <= A(3);
--			when "100" =>
--				O <= A(4);
--			when "101" =>
--				O <= A(5);
--			when "110" =>
--				O <= A(6);
--			when "111" =>
--				O <= A(7);
--			when others =>
--				O <= '0';
--		end case;
--	end process;

-- WITH-SELECT

--	with B select
--		O <=	A(0) when "000",
--				A(1) when "001",
--				A(2) when "010",
--				A(3) when "011",
--				A(4) when "100",
--				A(5) when "101",
--				A(6) when "110",
--				A(7) when "111",
--				'0' when others;


-- WHEN-ELSE

	O <=	A(0) when B = "000" else
			A(1) when B = "001" else
			A(2) when B = "010" else
			A(3) when B = "011" else
			A(4) when B = "100" else
			A(5) when B = "101" else
			A(6) when B = "110" else
			A(7) when B = "111" else
			'0';
end Behavioral;

