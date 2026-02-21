----------------------------------------------------------------------------------
-- Company:       NYU Abu Dhabi
-- Engineer:      Andre, Sheena, Laial, Nancy
--
-- Create Date:   26/03/2025
-- Design Name:   ALU Code for FPGA
-- Module Name:  ALU - Behavioral
-- Project Name:  Advanced Digital Logic Lab 2 - ALU and Display
-- Target Device: FGPA
-- Tool Versions: Xilinx 
-- Description: 
-- Module that dictates ALU behvaior and operation. It takes two 4-bit inputs
-- and a 3-bit selection input that decides the operation to perform on the 
-- two 4-bit input numbers.
--
-- Dependencies: N/A
--
-- Additional Comments: N/A
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( 
        a : in  STD_LOGIC_VECTOR (3 downto 0);--4-bit input operand a
        b : in  STD_LOGIC_VECTOR (3 downto 0);--4-bit input operand b
        sel : in  STD_LOGIC_VECTOR (2 downto 0);--3-bit selection signal to choose operation
        result   : out STD_LOGIC_VECTOR (3 downto 0);--4-bit output result
        overflow : out STD_LOGIC--overflow flag for arithmetic operations
    );
end ALU;

architecture Behavioral of ALU is
    signal a_s, b_s : signed(3 downto 0);  -- Signed versions of inputs
    signal temp_sum : signed(4 downto 0);   -- 5-bit result for addition
    signal temp_diff: signed(4 downto 0);    -- 5-bit result for subtraction
    signal shift_amt: integer;              -- Shift amount (0 to 3)
begin
    a_s <= signed(a);--convert input `a` from std_logic_vector to signed type
    b_s <= signed(b);--convert input `b` from std_logic_vector to signed type

    shift_amt <= to_integer(unsigned(b));--convert `b` to integer for shift operations

    process(a, b, sel)--process block that executes ALU operations based on `sel`
		variable temp_sum  : signed(4 downto 0);
		variable temp_diff : signed(4 downto 0);
    begin
        case sel is
            when "000" =>  -- Addition Operation (a_s + b_s)
                temp_sum := resize(a_s, 5) + resize(b_s, 5);
                if temp_sum(4) /= temp_sum(3) then
                    -- Overflow detected; saturate result based on sign
                    overflow <= '1';
                    if a_s(3) = '0' then
                        result <= "0111";  -- Positive saturation (+7)
                    else
                        result <= "1000";  -- Negative saturation (–8)
                    end if;
                else
                    overflow <= '0';
                    result <= std_logic_vector(temp_sum(3 downto 0));
                end if;						  
				
            when "001" =>  -- Subtraction Operation (a_s - b_s)
                temp_diff := resize(a_s, 5) - resize(b_s, 5);
                if temp_diff(4) /= temp_diff(3) then
                    -- Overflow detected; saturate result
                    overflow <= '1';
                    if a_s(3) = '0' then
                        result <= "0111";  -- Positive saturation
                    else		
                        result <= "1000";  -- Negative saturation
                    end if;
                else
                    overflow <= '0';
                    result <= std_logic_vector(temp_diff(3 downto 0));
                end if;
						  
            when "010" =>  -- Bitwise AND
                result <= a and b;
                overflow <= '0';

            when "011" =>  -- Bitwise OR
                result <= a or b;
                overflow <= '0';

            when "100" => -- Logical Shift Left
                result <= std_logic_vector(shift_left(unsigned(a), shift_amt));
                overflow <= '0';

            when "101" => -- Logical Shift Right
                result <= std_logic_vector(shift_right(unsigned(a), shift_amt));
                overflow <= '0';
					 
            when "110" =>  -- Arithmetic Shift Right (using signed arithmetic)
                result <= std_logic_vector(shift_right(a_s, shift_amt));
                overflow <= '0';	 
					 
            when others =>
                result <= (others => 'X');--undefined operation, assign unknown values
                overflow <= 'X';--undefined overflow flag
        end case;
    end process;
end Behavioral;
