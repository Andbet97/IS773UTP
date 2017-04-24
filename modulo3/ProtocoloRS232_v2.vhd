library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProtocoloRS232_v2 is
    Port ( Tx_salida : out  STD_LOGIC;
           Rx_entrada : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CampanaTx : in  STD_LOGIC;
           CampanaRx : out  STD_LOGIC;
           Dato_Tx : in  STD_LOGIC_VECTOR (7 downto 0);
           Dato_Rx : out  STD_LOGIC_VECTOR (7 downto 0));
end ProtocoloRS232_v2;

architecture Behavioral of ProtocoloRS232_v2 is

	COMPONENT Rx
	PORT(
		Dato_entrada : IN std_logic;
		CLK : IN std_logic;          
		Dato_salida : OUT std_logic_vector(7 downto 0);
		Campana : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Tx
	PORT(
		Campana : IN std_logic;
		CLK : IN std_logic;
		Dato_entrada : IN std_logic_vector(7 downto 0);          
		Dato_salida : OUT std_logic
		);
	END COMPONENT;
	
begin

	Inst_Rx: Rx PORT MAP(
		Dato_entrada => Rx_entrada,
		CLK => CLK,
		Dato_salida => Dato_Rx,
		Campana => CampanaRx
	);

	Inst_Tx: Tx PORT MAP(
		Campana => CampanaTx,
		CLK => CLK,
		Dato_entrada => Dato_Tx,
		Dato_salida => Tx_salida
	);

end Behavioral;

