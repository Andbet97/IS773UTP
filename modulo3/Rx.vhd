library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Rx is
    Port ( Dato_entrada : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Dato_salida : out  STD_LOGIC_VECTOR (7 downto 0);
           Campana : out  STD_LOGIC);
end Rx;

architecture Behavioral of Rx is
	
	COMPONENT Divisor
	PORT(
		clk : IN std_logic;          
		newC : OUT std_logic
		);
	END COMPONENT;
	
	signal reloj_baudios : std_logic := '0';
	signal estado : std_logic_vector(1 downto 0) := "00"; 
	-- 00 -> Recepcion de Idle
	-- 01 -> Recepcion de dato
	-- 10 -> bit de paridad
	-- 11 -> bits de parada
	
	signal contador_de_bits : std_logic_vector(3 downto 0) := "0000"; 
	signal Paridad : std_logic := '0';
	
	signal aux : std_logic_vector(7 downto 0) := "00000000";
	
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
			
			Campana <= '0';
			
			if (estado = "00" and Dato_entrada = '0') then
				estado <= "01";
			elsif (estado = "01") then
			
				if (Dato_entrada = '1') then
					Paridad <= not Paridad;
				end if;
				Dato_temporal(6 downto 0) := Dato_temporal(7 downto 1);
				Dato_temporal(7) := Dato_entrada;
				contador_de_bits <= contador_de_bits + 1;
				if (contador_de_bits >= "0111") then
					contador_de_bits <= (others => '0');
					estado <= "10";
				end if;
				
			elsif (estado = "10") then
			
				if (Paridad = Dato_entrada) then
					estado <= "11";
				else
					estado <= "00";
					Paridad <= '0';
				end if;
				
			elsif (estado = "11") then
			
				if (contador_de_bits = "0001") then
					estado <= "00";
					contador_de_bits <= (others => '0');
					aux <= Dato_temporal;
					Campana <= '1';
				elsif (Dato_entrada = '1') then
					contador_de_bits <= contador_de_bits + 1;
				else
					estado <= "00";
					Paridad <= '0';
				end if;
				
			end if;
			
		end if;
		
	end process;

end Behavioral;

