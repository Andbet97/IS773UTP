--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:21:34 03/01/2017
-- Design Name:   
-- Module Name:   C:/Users/Estudiantes/Desktop/andres/motorpap/Motorapasos_tb.vhd
-- Project Name:  motorpap
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Motor_a_pasos
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
 
ENTITY Motorapasos_tb IS
END Motorapasos_tb;
 
ARCHITECTURE behavior OF Motorapasos_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Motor_a_pasos
    PORT(
         StepDrive : OUT  std_logic_vector(3 downto 0);
         Direction : IN  std_logic;
         StepEnable : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Direction : std_logic := '0';
   signal StepEnable : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal StepDrive : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Motor_a_pasos PORT MAP (
          StepDrive => StepDrive,
          Direction => Direction,
          StepEnable => StepEnable,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      StepEnable <= '1';
		direction <= '1';
		wait for 270 ms;
		direction <= '0';
		wait for 430 ms;
		StepEnable <= '0';
      --wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
