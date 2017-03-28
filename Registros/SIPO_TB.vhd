LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SIPO_TB IS
END SIPO_TB;
 
ARCHITECTURE behavior OF SIPO_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SIPO
    PORT(
         I : IN  std_logic;
         CLR : IN  std_logic;
         CLK : IN  std_logic;
         O : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic := '0';
   signal CLR : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal O : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SIPO PORT MAP (
          I => I,
          CLR => CLR,
          CLK => CLK,
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
		I <= '1';
		wait for 10 ns;
		I <= '0';
		wait for 20 ns;
		I <= '1';
		wait for 40 ns;
		I <= '0';
		wait;
   end process;

END;
