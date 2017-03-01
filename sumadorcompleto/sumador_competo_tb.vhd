--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:29:11 02/19/2017
-- Design Name:   
-- Module Name:   C:/ANDRES(temp)/Lab. Electronica Digital/sumedio/sumador_competo_tb.vhd
-- Project Name:  sumedio
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumpleto
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
 
ENTITY sumador_competo_tb IS
END sumador_competo_tb;
 
ARCHITECTURE behavior OF sumador_competo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumpleto
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         cout : OUT  std_logic;
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal cout : std_logic;
   signal s : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumpleto PORT MAP (
          a => a,
          b => b,
          cin => cin,
          cout => cout,
          s => s
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		--000
      wait for 100 ns;
		--001
		b <= '1';
		wait for 100 ns;
		--010
		b <= '0';
		a <= '1';
		wait for 100 ns;
		--011
		b <= '1';
		wait for 100 ns;
		--100
		b <= '0';
		a <= '0';
		cin <= '1';
		wait for 100 ns;
		--101
		b <= '1';
		wait for 100 ns;
		--110
		b <= '0';
		a <= '1';
		wait for 100 ns;
		--111
		b <= '1';

      wait;
   end process;

END;
