----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:06:40 02/19/2017 
-- Design Name: 
-- Module Name:    sumpleto - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumpleto is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           s : out  STD_LOGIC);
end sumpleto;

architecture Behavioral of sumpleto is

-- VHDL Instantiation Created from source file sumador_medio.vhd -- 20:10:20 02/19/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT sumador_medio
	PORT(
		a : IN std_logic;
		b : IN std_logic;          
		cout : OUT std_logic;
		s : OUT std_logic
		);
	END COMPONENT;

signal out0 : STD_LOGIC := '0';
signal c0 : STD_LOGIC := '0';
signal out1 : STD_LOGIC := '0';

begin

Inst_sumador_medio_1: sumador_medio PORT MAP(
		a => a,
		b => b,
		cout => out0,
		s => c0
	);

Inst_sumador_medio_2: sumador_medio PORT MAP(
		a => c0,
		b => cin,
		cout => out1,
		s => s
	);

Inst_sumador_medio_3: sumador_medio PORT MAP(
		a => out0,
		b => out1,
		--cout => ,
		s => cout
	);
end Behavioral;

