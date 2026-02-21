library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity single_number is
    Port ( number : in  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (0 to 7));
end single_number;

architecture Behavioral of single_number is

begin

with number select seg <=
	-- A_B_C_D_E_F_G_DP; 0 is on, 1 is off
	"00000011" when "0000", -- 0
	"10011111" when "0001", -- 1 
	"00100101" when "0010", -- 2
	"00001101" when "0011", -- 3
	"10011001" when "0100", -- 4
	"01001001" when "0101", -- 5
	"01000001" when "0110", -- 6
	"00011111" when "0111", -- 7
	"00000000" when "1000", -- -8
	"00011110" when "1001", -- -7
	"01000000" when "1010", -- -6
	"01001000" when "1011", -- -5
	"10011000" when "1100", -- -4
	"00001100" when "1101", -- -3
	"00100100" when "1110", -- -2
	"10011110" when "1111", -- -1
	"11111111" when others; -- all off

end Behavioral;

