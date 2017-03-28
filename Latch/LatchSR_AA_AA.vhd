----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:32:45 03/09/2017 
-- Design Name: 
-- Module Name:    LatchSR_AA_AA - Behavioral 
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

entity LatchSR_AA_AA is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qn : out  STD_LOGIC);
end LatchSR_AA_AA;

architecture Behavioral of LatchSR_AA_AA is

COMPONENT LatchSR_AB
	PORT(
		Sn : IN std_logic;
		Rn : IN std_logic;          
		Q : OUT std_logic;
		Qn : OUT std_logic
		);
	END COMPONENT;

signal S_aux : std_logic := '0';
signal R_aux : std_logic := '0';

begin

S_aux <= S nand EN;
R_aux <= R nand EN;

	Inst_LatchSR_AB: LatchSR_AB PORT MAP(
		Sn => S_aux,
		Rn => R_aux,
		Q => Q,
		Qn => Qn
	);


end Behavioral;

