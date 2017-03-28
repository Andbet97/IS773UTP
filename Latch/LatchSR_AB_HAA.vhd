library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LatchSR_AB_HAA is
    Port ( Sn : in  STD_LOGIC;
           Rn : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qn : out  STD_LOGIC);
end LatchSR_AB_HAA;

architecture Behavioral of LatchSR_AB_HAA is

COMPONENT LatchSR_AA
	PORT(
		S : IN std_logic;
		R : IN std_logic;          
		Q : OUT std_logic;
		Qn : OUT std_logic
		);
	END COMPONENT;
	
signal S_aux : std_logic := '0';
signal R_aux : std_logic := '0';

begin

S_aux <= Sn nor (not EN);
R_aux <= Rn nor (not EN);

Inst_LatchSR_AA: LatchSR_AA PORT MAP(
		S => S_aux,
		R => R_aux,
		Q => Q,
		Qn => Qn 
	);

end Behavioral;

