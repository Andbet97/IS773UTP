library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity Memoria is 
port( clk, lectura_escritura, habilitador: in STD_LOGIC; 
		direccion: in STD_LOGIC_VECTOR(3 downto 0); 
		dato_entrada: in STD_LOGIC_VECTOR(2 downto 0); 
		dato_salida: out STD_LOGIC_VECTOR(2 downto 0)); 
end Memoria; 

architecture Behavioral of Memoria is 

	constant bits_direccion : integer := 4;
	constant bits_dato : integer := 3;

	type Block_ram is array(2**bits_direccion-1 downto 0) of STD_LOGIC_VECTOR(bits_dato-1 downto 0); 
	signal RAM: Block_ram; 

begin 

process(clk) 

begin 

	if clk'event and clk = '1' then 

		if habilitador = '1' then 
			if lectura_escritura = '1' then 
				RAM(conv_integer(direccion)) <= dato_entrada; 
			else 
				dato_salida <= RAM(conv_integer(direccion));
			end if; 
		end if;
	end if;

end process; 

end Behavioral;