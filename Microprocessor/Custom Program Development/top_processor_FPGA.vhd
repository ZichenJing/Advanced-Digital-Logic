library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.common.all;

entity top_processor_FPGA is
    port (
        next_instr : in  STD_LOGIC;
        clk        : in  STD_LOGIC;
        rst        : in  STD_LOGIC;
        -- Display interface
        seg_bits   : out STD_LOGIC_VECTOR(0 to 7);
        seg_an     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end entity top_processor_FPGA;

architecture Behavioral of top_processor_FPGA is

    -- Component declarations
    component Display_Controller
        port (
            clk       : in  STD_LOGIC;
            rst       : in  STD_LOGIC;
            opcode    : in  opcode_type;
            operand_1 : in  STD_LOGIC_VECTOR(13 downto 0);
            operand_2 : in  STD_LOGIC_VECTOR(13 downto 0);
            result    : in  STD_LOGIC_VECTOR(13 downto 0);
            overflow  : in  STD_LOGIC;
            seg_bits  : out STD_LOGIC_VECTOR(0 to 7);
            seg_an    : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component Display_Controller;

    component Instructions_ROM
        port (
            address_in : in  STD_LOGIC_VECTOR(6 downto 0);
            data_out   : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component Instructions_ROM;

    component Decoder
        port (
            instruction_in : in  STD_LOGIC_VECTOR(15 downto 0);
            opcode_out     : out opcode_type;
            Rd_addr_out    : out STD_LOGIC_VECTOR(2 downto 0);
            Rs1_addr_out   : out STD_LOGIC_VECTOR(2 downto 0);
            Rs2_addr_out   : out STD_LOGIC_VECTOR(2 downto 0);
            immediate_out  : out STD_LOGIC_VECTOR(13 downto 0)
        );
    end component Decoder;

    component Controller
        port (
            opcode        : in  opcode_type;
            operand_1     : out STD_LOGIC_VECTOR(13 downto 0);
            operand_2     : out STD_LOGIC_VECTOR(13 downto 0);
            result        : in  STD_LOGIC_VECTOR(13 downto 0);
            curr_PC       : in  STD_LOGIC_VECTOR(6 downto 0);
            new_PC        : out STD_LOGIC_VECTOR(6 downto 0);
            PC_we         : out STD_LOGIC;
            PC_incr       : out STD_LOGIC;
            Rs1_data      : in  STD_LOGIC_VECTOR(13 downto 0);
            Rs2_data      : in  STD_LOGIC_VECTOR(13 downto 0);
            immediate     : in  STD_LOGIC_VECTOR(13 downto 0);
            Rd_we         : out STD_LOGIC;
            Rd_data       : out STD_LOGIC_VECTOR(13 downto 0)
        );
    end component Controller;

    component PC
        port (
            clk     : in  STD_LOGIC;
            rst     : in  STD_LOGIC;
            PC_in   : in  STD_LOGIC_VECTOR(6 downto 0);
            PC_out  : out STD_LOGIC_VECTOR(6 downto 0);
            PC_we   : in  STD_LOGIC;
            PC_incr : in  STD_LOGIC
        );
    end component PC;

    component Registers
        port (
            clk           : in  STD_LOGIC;
            rst           : in  STD_LOGIC;
            Rs1_addr_in   : in  STD_LOGIC_VECTOR(2 downto 0);
            Rs1_data_out  : out STD_LOGIC_VECTOR(13 downto 0);
            Rs2_addr_in   : in  STD_LOGIC_VECTOR(2 downto 0);
            Rs2_data_out  : out STD_LOGIC_VECTOR(13 downto 0);
            Rd_addr_in    : in  STD_LOGIC_VECTOR(2 downto 0);
            Rd_data_in    : in  STD_LOGIC_VECTOR(13 downto 0);
            Rd_we         : in  STD_LOGIC
        );
    end component Registers;

    component ALU
        port (
            operand_1 : in  STD_LOGIC_VECTOR(13 downto 0);
            operand_2 : in  STD_LOGIC_VECTOR(13 downto 0);
            opcode    : in  opcode_type;
            result    : out STD_LOGIC_VECTOR(13 downto 0);
            overflow  : out STD_LOGIC
        );
    end component ALU;

    -- Internal signals
    signal clk_proc           : STD_LOGIC;
    signal rst_disp           : STD_LOGIC;
    signal curr_PC_sig        : STD_LOGIC_VECTOR(6 downto 0);
    signal instruction_sig    : STD_LOGIC_VECTOR(15 downto 0);
    signal new_PC_sig         : STD_LOGIC_VECTOR(6 downto 0);
    signal PC_we_sig          : STD_LOGIC;
    signal PC_incr_sig        : STD_LOGIC;
    signal opcode_internal    : opcode_type;
    signal Rd_addr_sig        : STD_LOGIC_VECTOR(2 downto 0);
    signal Rs1_addr_sig       : STD_LOGIC_VECTOR(2 downto 0);
    signal Rs2_addr_sig       : STD_LOGIC_VECTOR(2 downto 0);
    signal immediate_sig      : STD_LOGIC_VECTOR(13 downto 0);
    signal Rd_data_sig        : STD_LOGIC_VECTOR(13 downto 0);
    signal Rs1_data_sig       : STD_LOGIC_VECTOR(13 downto 0);
    signal Rs2_data_sig       : STD_LOGIC_VECTOR(13 downto 0);
    signal Rd_we_sig          : STD_LOGIC;
    signal operand_1_internal : STD_LOGIC_VECTOR(13 downto 0);
    signal operand_2_internal : STD_LOGIC_VECTOR(13 downto 0);
    signal result_internal    : STD_LOGIC_VECTOR(13 downto 0);
    signal overflow_internal  : STD_LOGIC;

begin

    -- Simplified clock and reset
    clk_proc <= next_instr;
    rst_disp <= rst or clk_proc;

    -- Component instantiations
    Display_Controller_inst : Display_Controller
        port map (
            clk       => clk,
            rst       => rst_disp,
            opcode    => opcode_internal,
            operand_1 => operand_1_internal,
            operand_2 => operand_2_internal,
            result    => result_internal,
            overflow  => overflow_internal,
            seg_bits  => seg_bits,
            seg_an    => seg_an
        );

    Instructions_ROM_inst : Instructions_ROM
        port map (
            address_in => curr_PC_sig,
            data_out   => instruction_sig
        );

    Decoder_inst : Decoder
        port map (
            instruction_in => instruction_sig,
            opcode_out     => opcode_internal,
            Rd_addr_out    => Rd_addr_sig,
            Rs1_addr_out   => Rs1_addr_sig,
            Rs2_addr_out   => Rs2_addr_sig,
            immediate_out  => immediate_sig
        );

    Controller_inst : Controller
        port map (
            opcode    => opcode_internal,
            operand_1 => operand_1_internal,
            operand_2 => operand_2_internal,
            result    => result_internal,
            curr_PC   => curr_PC_sig,
            new_PC    => new_PC_sig,
            PC_we     => PC_we_sig,
            PC_incr   => PC_incr_sig,
            Rs1_data  => Rs1_data_sig,
            Rs2_data  => Rs2_data_sig,
            immediate => immediate_sig,
            Rd_we     => Rd_we_sig,
            Rd_data   => Rd_data_sig
        );

    PC_inst : PC
        port map (
            clk     => clk_proc,
            rst     => rst,
            PC_in   => new_PC_sig,
            PC_out  => curr_PC_sig,
            PC_we   => PC_we_sig,
            PC_incr => PC_incr_sig
        );

    Registers_inst : Registers
        port map (
            clk           => clk_proc,
            rst           => rst,
            Rs1_addr_in   => Rs1_addr_sig,
            Rs1_data_out  => Rs1_data_sig,
            Rs2_addr_in   => Rs2_addr_sig,
            Rs2_data_out  => Rs2_data_sig,
            Rd_addr_in    => Rd_addr_sig,
            Rd_data_in    => Rd_data_sig,
            Rd_we         => Rd_we_sig
        );

    ALU_inst : ALU
        port map (
            operand_1 => operand_1_internal,
            operand_2 => operand_2_internal,
            opcode    => opcode_internal,
            result    => result_internal,
            overflow  => overflow_internal
        );

end architecture Behavioral;
