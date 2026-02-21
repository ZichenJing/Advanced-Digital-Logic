library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.common.all;

entity Decoder is
	port ( 	instruction_in : in STD_LOGIC_VECTOR (15 downto 0);
		opcode_out : out opcode_type;
		Rd_addr_out : out STD_LOGIC_VECTOR (2 downto 0);
		Rs1_addr_out : out STD_LOGIC_VECTOR (2 downto 0);
		Rs2_addr_out : out STD_LOGIC_VECTOR (2 downto 0);
		immediate_out : out STD_LOGIC_VECTOR (13 downto 0)
	     );
end Decoder;

architecture Behavioral of Decoder is

signal opcode_internal : opcode_type;

-- intermediate signals for unpacking instruction fields
signal Rd     : STD_LOGIC_VECTOR(2 downto 0);
signal Rs1    : STD_LOGIC_VECTOR(2 downto 0);
signal Rs2    : STD_LOGIC_VECTOR(2 downto 0);
signal immediate_val            : STD_LOGIC_VECTOR(5 downto 0); 

begin
            opcode_out <= opcode_internal;
	opcode_internal <= std_logic_vector_to_opcode_type( instruction_in(15 downto 12) );

-- unpack register numbers directly from instruction bits
	Rd_addr_out <= instruction_in(11 downto 9);
	Rs1_addr_out <= instruction_in(8 downto 6);
	Rs2_addr_out <= instruction_in(5 downto 3);
-- extract the 6-bit immediate from the instruction
	immediate_val <= instruction_in(5 downto 0); 

	
	
	
	process(opcode_internal, Rs2, Rd, immediate_val)
begin
   if opcode_internal = OP_ANDI then
        immediate_out <= "11111111" & immediate_val; -- ANDI: upper bits are all 1s
        
    elsif (opcode_internal = OP_ORI) or (opcode_internal = OP_XORI) then
        immediate_out <= "00000000" & immediate_val; -- ORI, XORI are 0s
        
    elsif (opcode_internal = OP_ADDI) or (opcode_internal = OP_SUBI) then
        immediate_out <= (13 downto 6 => immediate_val(5)) & immediate_val; -- ADDI, SUBI will make sign-extend by 5 bits
        
    elsif (opcode_internal = OP_SLL) or (opcode_internal = OP_SRL) then
        immediate_out <= (10 downto 0 => '0') & immediate_val(2 downto 0); -- SLL, SRL only lower 3 bits are used for shift
        
    elsif (opcode_internal = OP_BLT) or
          (opcode_internal = OP_BE)  or
          (opcode_internal = OP_JMP) then
        immediate_out <= (13 downto 6 => immediate_val(5)) & immediate_val; -- BLT, BE, JMP sign-extend bit 5 for branch or jump
        
    else

        immediate_out <= (others => '0'); -- default thus no immediate
    end if;
end process;
	
end Behavioral;
