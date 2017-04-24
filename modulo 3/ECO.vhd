library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ECO is
    Port ( Rx : in  STD_LOGIC;
           Tx : out  STD_LOGIC;
           CLK : in  STD_LOGIC);
end ECO;

architecture Behavioral of ECO is

	COMPONENT ProtocoloRS232_v2
	PORT(
		Rx_entrada : IN std_logic;
		CLK : IN std_logic;
		CampanaTx : IN std_logic;
		Dato_Tx : IN std_logic_vector(7 downto 0);          
		Tx_salida : OUT std_logic;
		CampanaRx : OUT std_logic;
		Dato_Rx : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	signal campana : std_logic := '0';
	signal Dato : std_logic_vector(7 downto 0) := "00000000";
 
begin

	Inst_ProtocoloRS232_v2: ProtocoloRS232_v2 PORT MAP(
		Tx_salida => Tx,
		Rx_entrada => Rx,
		CLK => CLK,
		CampanaTx => campana,
		CampanaRx => campana,
		Dato_Tx => Dato,
		Dato_Rx => Dato
	);

end Behavioral;

