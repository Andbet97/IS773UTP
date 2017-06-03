LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY memoria_tb IS
END memoria_tb;
 
ARCHITECTURE behavior OF memoria_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memoria
    PORT(
         clk : IN  std_logic;
         lectura_escritura : IN  std_logic;
         habilitador : IN  std_logic;
         direccion : IN  std_logic_vector(3 downto 0);
         dato_entrada : IN  std_logic_vector(2 downto 0);
         dato_salida : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal lectura_escritura : std_logic := '0';
   signal habilitador : std_logic := '0';
   signal direccion : std_logic_vector(3 downto 0) := (others => '0');
   signal dato_entrada : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal dato_salida : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memoria PORT MAP (
          clk => clk,
          lectura_escritura => lectura_escritura,
          habilitador => habilitador,
          direccion => direccion,
          dato_entrada => dato_entrada,
          dato_salida => dato_salida
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		habilitador <= '1';
      lectura_escritura <= '1';		-- Escritura
		wait for 10 ns;
		direccion <= "0000"; 			-- Guardando dato
		dato_entrada <= "101";
		wait for 30 ns;
		direccion <= "0100"; 			-- Guardando dato
		dato_entrada <= "001";
		wait for 30 ns; 
		lectura_escritura <= '0';		-- Lectura
		direccion <= "0000";				-- Leyendo dato
		wait for 30 ns;
		direccion <= "0100";				-- Leyendo dato
		wait for 30 ns;
		direccion <= "1111";				-- Leyendo de una posicion no asignada

      wait;
   end process;

END;
