library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.common.all;

entity Instructions_ROM is
    port (
        address_in : in  STD_LOGIC_VECTOR (6 downto 0);
        data_out   : out STD_LOGIC_VECTOR (15 downto 0)
    );
end Instructions_ROM;

architecture Behavioral of Instructions_ROM is

    type ROM_type is array (0 to 127) of STD_LOGIC_VECTOR (15 downto 0);
    signal rom : ROM_type;

begin
    data_out <= rom(to_integer(unsigned(address_in)));

    rom_process : process(address_in)
    begin
        -- reset all locations to HLT
        for i in 0 to 127 loop
            rom(i) <= opcode_type_to_std_logic_vector(OP_HALT) & (11 downto 0 => 'X');
        end loop;

        -- your five new instructions:
        rom(0) <= "1001001000000101";  -- 1001 001 000 000 101
        rom(1) <= "1001010000000000";  -- 1001 010 000 000 000
        rom(2) <= "1001010010000101";  -- 1001 010 010 000 101
        rom(3) <= "1011001001000001";  -- 1011 001 001 000 001
        rom(4) <= "1100111000001110";  -- 1100 111 000 001 110

        -- tail entries to infer all registers (leave as is)
        rom(121) <= opcode_type_to_std_logic_vector(OP_ADD) & b"001_001_000_000";
        rom(122) <= opcode_type_to_std_logic_vector(OP_ADD) & b"010_010_001_000";
        rom(123) <= opcode_type_to_std_logic_vector(OP_ADD) & b"011_011_010_000";
        rom(124) <= opcode_type_to_std_logic_vector(OP_ADD) & b"100_100_011_000";
        rom(125) <= opcode_type_to_std_logic_vector(OP_ADD) & b"101_101_100_000";
        rom(126) <= opcode_type_to_std_logic_vector(OP_ADD) & b"110_110_101_000";
        rom(127) <= opcode_type_to_std_logic_vector(OP_ADD) & b"111_111_110_000";
    end process;

end Behavioral;
