

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.common.all;

entity Instructions_ROM is
	port (	address_in : in STD_LOGIC_VECTOR (6 downto 0);
		data_out : out STD_LOGIC_VECTOR (15 downto 0)
	     );
end Instructions_ROM;

architecture Behavioral of Instructions_ROM is

type ROM_type is array (0 to 127) of STD_LOGIC_VECTOR (15 downto 0);
signal rom : ROM_type;

begin
	data_out <= rom ( to_integer(unsigned(address_in)) );

	rom_process : process (address_in)
	begin
		-- LEAVE AS IS
		--
		-- reset ROM content completely with HLT operations; note that loop will be unrolled during synthesis
		for i in 0 to 127 loop 
			rom(i) <= opcode_type_to_std_logic_vector(OP_HALT) & (11 downto 0 => 'X'); 
		end loop;

		-- Initialization (inputs into R1 and R2)
		rom(0)  <= opcode_type_to_std_logic_vector(OP_ADDI) & "001" & "000" & "000101"; -- R1 = 5
		rom(1)  <= opcode_type_to_std_logic_vector(OP_ADDI) & "010" & "000" & "001011"; -- R2 = 11

		-- Compute R3 = R1 - R2
		rom(2)  <= opcode_type_to_std_logic_vector(OP_SUB) & "011" & "001" & "010" & "000"; -- R3 = R1 - R2

		-- If R3 < 0, negate R3: R3 = -R3
		rom(3)  <= opcode_type_to_std_logic_vector(OP_BLT) & "000" & "011" & "000" & "010"; -- if R3 < 0, jump +2 to negate
		rom(4)  <= opcode_type_to_std_logic_vector(OP_JMP) & "000" & "000" & "000" & "010"; -- else skip negate
		rom(5)  <= opcode_type_to_std_logic_vector(OP_SUB) & "011" & "000" & "011" & "000"; -- R3 = 0 - R3 (negate)


		-- Show absolute difference
		rom(6) <= opcode_type_to_std_logic_vector(OP_ADDI) & "011" & "011" & "000" & "000"; -- show R3

		-- Done
		rom(7) <= opcode_type_to_std_logic_vector(OP_HALT) & (11 downto 0 => 'X');

		-- LEAVE AS IS
		--
		-- This dummy code below helps to infer all 7 registers (R1--R7) in the register file, without short-cuts into combinatorial
		-- logic due to tool optimization; that is important to ensure the same baseline hardware configuration for all
		rom(121) <= opcode_type_to_std_logic_vector(OP_ADD) & b"001_001_000_000";
		rom(122) <= opcode_type_to_std_logic_vector(OP_ADD) & b"010_010_001_000";
		rom(123) <= opcode_type_to_std_logic_vector(OP_ADD) & b"011_011_010_000";
		rom(124) <= opcode_type_to_std_logic_vector(OP_ADD) & b"100_100_011_000";
		rom(125) <= opcode_type_to_std_logic_vector(OP_ADD) & b"101_101_100_000";
		rom(126) <= opcode_type_to_std_logic_vector(OP_ADD) & b"110_110_101_000";
		rom(127) <= opcode_type_to_std_logic_vector(OP_ADD) & b"111_111_110_000";

	end process;

end Behavioral;



