--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:48:52 03/26/2025
-- Design Name:   
-- Module Name:   C:/Xilinx/Lab1/Task1/Lab1_Task1/Task_1_tb.vhd
-- Project Name:  Lab1_Task1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Task_1
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Task_l_tb IS
END Task_l_tb;

ARCHITECTURE behavior OF Task_l_tb IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT Task_l
PORT(
    A : IN std_logic;
    B : IN std_logic;
    C : IN std_logic;
    D : IN std_logic;
    X : OUT std_logic
);
END COMPONENT;


--Inputs
signal A_tb : std_logic := '0';
signal B_tb : std_logic := '0';
signal C_tb : std_logic := '0';
signal D_tb : std_logic := '0';--test values initialised to value 0

--Outputs
signal X_tb : std_logic;


BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: Task_l PORT MAP (
    A => A_tb,
    B => B_tb,
    C => C_tb,
    D => D_tb,
    X => X_tb
);

-- Stimulus process
stim_procl: process--stimulation process for A
begin
    wait for 100 ns;
    A_tb <= not A_tb;
end process;

stim_proc2: process--stimulation process for B
begin
    wait for 75 ns;
    B_tb <= not B_tb;
end process;

stim_proc3: process--stimulation process for C
begin
    wait for 50 ns;
    C_tb <= not C_tb;
end process;

stim_proc4: process--stimulation process for D
begin
    wait for 25 ns;
    D_tb <= not D_tb;
end process;

END;