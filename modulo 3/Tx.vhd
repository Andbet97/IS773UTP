library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Tx is
    Port ( Campana : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Dato_entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           Dato_salida : out  STD_LOGIC);
end Tx;

architecture Behavioral of Tx is
	
	COMPONENT Divisor
	PORT(
		clk : IN std_logic;          
		newC : OUT std_logic
		);
	END COMPONENT;
	
	signal reloj_baudios : std_logic := '0';
	signal estado : std_logic_vector(1 downto 0) := "00"; 
	-- 00 -> Salida Idle
	-- 01 -> Envio de dato
	-- 10 -> Envio de bit de paridad
	-- 11 -> Envio de bits de parada
	
	signal contador_de_bits : std_logic_vector(3 downto 0) := "0000"; 
	signal Paridad : std_logic := '0';
	
	signal aux : std_logic := '1'; -- inicializar la salida en '1', en idle.
	
begin

	Inst_Divisor: Divisor PORT MAP(
		clk => CLK,
		newC => reloj_baudios
	);
	
	Dato_salida <= aux;
	
	process (CLK)
		
		variable Dato_temporal : std_logic_vector(7 downto 0) := (others => '0');
		
	begin
	
		if (rising_edge(CLK) and reloj_baudios = '1') then
			
			if (estado = "00") then
				
				aux <= '1';
				if (Campana = '1') then
					Dato_temporal := Dato_entrada; 
					estado <= "01";
					aux <= '0';
				end if;
			
			elsif (estado = "01") then
			
				if (Dato_temporal(0) = '1') then
					Paridad <= not Paridad;
				end if;
				aux <= Dato_temporal(0);
				Dato_temporal := '0' & Dato_temporal(7 downto 1);				
				contador_de_bits <= contador_de_bits + 1;
				if (contador_de_bits >= "0111") then
					contador_de_bits <= (others => '0');
					estado <= "10";
				end if;
				
			elsif (estado = "10") then
			
				aux <= Paridad;
				estado <= "11";
				
			elsif (estado = "11") then
				
				if (contador_de_bits = "0001") then
					estado <= "00";
					contador_de_bits <= (others => '0');
					aux <= '1';
					Paridad <= '0';
				else
					aux <= '1';
					contador_de_bits <= contador_de_bits + 1;
				end if;
				
			end if;
			
		end if;
		
	end process;

end Behavioral;


