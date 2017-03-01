--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:58:18 02/19/2017
-- Design Name:   
-- Module Name:   C:/ANDRES(temp)/Lab. Electronica Digital/sumedio/sumador_medio_tb.vhd
-- Project Name:  sumedio
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumador_medio
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
 
ENTITY sumador_medio_tb IS
END sumador_medio_tb;
 
ARCHITECTURE behavior OF sumador_medio_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador_medio
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cout : OUT  std_logic;
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Outputs
   signal cout : std_logic;
   signal s : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador_medio PORT MAP (
          a => a,
          b => b,
          cout => cout,
          s => s
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --00
		wait for 100 ns;
		--01
		b <= '1';
		wait for 100 ns;
		--11
		a <= '1';
		wait for 100 ns;
		--10
		b <= '0';
      wait;
   end process;

END;
