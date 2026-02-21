----------------------------------------------------------------------------------
-- Company: NYU Abu Dhabi
-- Engineer: Laial, Sheena, Andre, Nancy
-- 
-- Create Date:    15:47:10 03/26/2025 
-- Design Name: 
-- Module Name:    Task_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISHM;
--use UNISHM.VComponents.all;

entity Task_1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           X : out STD_LOGIC);--assignment of the variables
    --A,B,C and D are inputs, X is output
end Task_1;

architecture Behavioral of Task_1 is --defining the behaviour

begin
    X <= not(A and B and C and D);--the behaviour of the NAND gate

end Behavioral;

