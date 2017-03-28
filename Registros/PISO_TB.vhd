LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PISO_TB IS
END PISO_TB;
 
ARCHITECTURE behavior OF PISO_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PISO
    PORT(
         SL : IN  std_logic;
         clk : IN  std_logic;
         A : IN  std_logic_vector(3 downto 0);
         S : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SL : std_logic := '0';
   signal clk : std_logic := '0';
   signal A : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PISO PORT MAP (
          SL => SL,
          clk => clk,
          A => A,
          S => S
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
      -- hold reset state for 100 ns.
      wait for 10 ns;
		SL <= '1';
		A <= "1011";
		wait for 10 ns;
		SL <= '0';
		A <= "0000";
      wait;
   end process;

END;
