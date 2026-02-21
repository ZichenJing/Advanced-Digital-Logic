--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:02:45 03/26/2025
-- Design Name:   
-- Module Name:   C:/Xilinx/Lab1/Task1/Lab1_Task2/Lab1_Task2/Task_2_tb.vhd
-- Project Name:  Lab1_Task2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Task_2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
---
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY Task_2_tb IS
END Task_2_tb;

ARCHITECTURE behavior OF Task_2_tb IS

-- Component Declaration for the Unit Under Test (UUI)

COMPONENT Task_2
PORT(
    A : IN std_logic;
    B : IN std_logic;
    S : OUT std_logic;
    C : OUT std_logic
);
END COMPONENT;


--Inputs
signal A_tb : std_logic := '0';
signal B_tb : std_logic := '0';

--Outputs
signal S_tb : std_logic;
signal C_tb : std_logic;

BEGIN

-- Instantiate the Unit Under Test (UUT)
   uut: Task_2 PORT MAP (
   A => A_tb,
   B => B_tb,
   S => S_tb,
   C => C_tb
   );


-- Stimulus process
   stim_procl: process--A stimulation
   begin

wait for 100 ns;
A_tb <= not A_tb;
end process;

stim_proc2: process--B stimulation
begin

wait for 50 ns;
B_tb <= not B_tb;
end process;

END;