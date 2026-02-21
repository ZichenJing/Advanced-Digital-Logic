----------------------------------------------------------------------------------
-- Company:       NYU Abu Dhabi
-- Engineer:      Andre, Sheena, Laial, Nancy
--
-- Create Date:   26/03/2025
-- Design Name:   ALU Display Controller for FPGA
-- Module Name:  
-- Project Name:  Advanced Digital Logic Lab 2 - ALU and Display
-- Target Device: FGPA
-- Tool Versions: Xilinx 
-- Description: 
-- Module that uses ALU and single_number modules to display ALU inputs
-- and ALU operation result on 7-segment display.
--
-- Dependencies:
-- ALU, single_number module
--
-- Additional Comments: N/A
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_display is
    Port ( 
        clk : in STD_LOGIC;                                 -- Clock input
        PI_a : in  STD_LOGIC_VECTOR (3 downto 0);           -- 4-bit operand A
        PI_b : in  STD_LOGIC_VECTOR (3 downto 0);           -- 4-bit operand B
        PI_sel : in  STD_LOGIC_VECTOR (2 downto 0);         -- 3-bit ALU operation selector
        PO_seg : out  STD_LOGIC_VECTOR (0 to 7);            -- Segment control lines 
        PO_an : out  STD_LOGIC_VECTOR (3 downto 0)          -- Digit enable lines (active low)
    );			  
end ALU_display;

architecture Behavioral of ALU_display is

    -- ALU component declaration
    component ALU
        Port (
            a        : in  STD_LOGIC_VECTOR (3 downto 0);
            b        : in  STD_LOGIC_VECTOR (3 downto 0);
            sel      : in  STD_LOGIC_VECTOR (2 downto 0);
            result   : out STD_LOGIC_VECTOR (3 downto 0);
            overflow : out STD_LOGIC
        );
    end component;

    -- single_number component declaration
    component single_number
        Port (
            number : in  STD_LOGIC_VECTOR (3 downto 0);
            seg    : out STD_LOGIC_VECTOR (0 to 7)
        );
    end component;

    -- Internal signals
    signal ALU_result : STD_LOGIC_VECTOR (3 downto 0);
    signal overflow   : STD_LOGIC;

    -- individual segment patterns
    signal seg_a      : STD_LOGIC_VECTOR (0 to 7);
    signal seg_b      : STD_LOGIC_VECTOR (0 to 7);
    signal seg_sel    : STD_LOGIC_VECTOR (0 to 7);
    signal seg_result : STD_LOGIC_VECTOR (0 to 7);

    -- helper signal for padded PI_sel
    signal sel_padded : STD_LOGIC_VECTOR (3 downto 0);

    -- Clock divider signals
    constant cnt_max : integer := 1e5; 
    signal clk_cnt         : integer range 0 to cnt_max;
    signal seg_mode        : integer range 0 to 3; 
    signal seg_mode_new    : integer range 0 to 3; 

begin

    -- Pad PI_sel with a 0 to make it 4 bits
    sel_padded <= PI_sel(2 downto 0) & '0';

    -- ALU instance connecting input ports to signals
    ALU_inst : ALU
        port map (
            a        => PI_a,
            b        => PI_b,
            sel      => PI_sel,
            result   => ALU_result,
            overflow => overflow
        );

    -- Segment decoders for each number displayed
    DIGIT_A : single_number
        port map (
            number => PI_a,
            seg    => seg_a
        );

    DIGIT_B : single_number
        port map (
            number => PI_b,
            seg    => seg_b
        );

    DIGIT_SEL : single_number
        port map (
            number => sel_padded,
            seg    => seg_sel
        );

    DIGIT_RESULT : single_number
        port map (
            number => ALU_result,
            seg    => seg_result
        );

    -- Clock divider process that cycles through seg_mode
    -- to activate each digit in sequence.
    seg_mode_switch : process (clk)
    begin
        if rising_edge(clk) then
            if (clk_cnt = cnt_max) then
                seg_mode <= seg_mode_new;
                clk_cnt <= 0;
            else
                clk_cnt <= clk_cnt + 1;
            end if;
        end if;
    end process;

    -- Main display; Displays each digit based on seg_mode as the following:
    -- Digit 0: PI_a
    -- Digit 1: PI_b
    -- Digit 2: PI_sel or 'F' if overflow
    -- Digit 3: ALU_result
   display : process (seg_mode, seg_a, seg_b, seg_result, seg_sel, overflow, PI_sel)
	begin
		case seg_mode is

				when 3 => -- Leftmost digit: displays PI_a
					PO_an <= "0111";
					PO_seg <= seg_a;
					seg_mode_new <= 2;
				
            when 2 => -- Second digit: displays PI_b
					PO_an <= "1011";
					PO_seg <= seg_b;
					seg_mode_new <= 1;
				
            when 1 => -- Third digit: displays PI_sel, F on overflow, or blank for specific selections
					PO_an <= "1101";
					if overflow = '1' then
						PO_seg <= "01110000";  -- Display F for overflow
--					elsif PI_sel = "101" then
--						PO_seg <= "11111111";  -- Blank (all segments off)
--					else
--						PO_seg <= seg_sel;
					else
						PO_seg <= "11111111";
					end if;
					seg_mode_new <= 0;

            when 0 => -- Rightmost digit: displays ALU_result (or blank on overflow)
					PO_an <= "1110";
					if overflow = '1' then
						PO_seg <= "11111111";  -- Blank the result display if there is an overflow
					else
						PO_seg <= seg_result;
					end if;
					seg_mode_new <= 3;

            when others => -- Fallback case
                PO_an <= "1111";
                PO_seg <= "11111111";
                seg_mode_new <= 3;

        end case;
    end process;

end Behavioral;
