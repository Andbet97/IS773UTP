library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LatchSR_AB is
    Port ( Sn : in  STD_LOGIC;
           Rn : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qn : out  STD_LOGIC);
end LatchSR_AB;

architecture Behavioral of LatchSR_AB is

signal Q_aux : std_logic := '0';
signal Qn_aux : std_logic := '0';

begin

Q <= Q_aux;
Qn <= Qn_aux;

Q_aux <= Sn nand Qn_aux;
Qn_aux <= Rn nand Q_aux;

end Behavioral;

