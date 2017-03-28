LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PISO8bits_TB IS
END PISO8bits_TB;
 
ARCHITECTURE behavior OF PISO8bits_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PISO8bits
    PORT(
         Reset : IN  std_logic;
         D : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         SL : IN  std_logic;
         O : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal D : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal SL : std_logic := '0';

 	--Outputs
   signal O : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PISO8bits PORT MAP (
          Reset => Reset,
          D => D,
          CLK => CLK,
          SL => SL,
          O => O
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
		wait for 10 ns;
		SL <= '1';
		D <= "10011010";
		wait for 10 ns;
		SL <= '0';
		D <= "00000000";
      wait;
   end process;

END;
