LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PIPO_TB IS
END PIPO_TB;
 
ARCHITECTURE behavior OF PIPO_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PIPO
    PORT(
         D : IN  std_logic_vector(3 downto 0);
         Q : OUT  std_logic_vector(3 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PIPO PORT MAP (
          D => D,
          Q => Q,
          CLK => CLK
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
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		D <= "1011";
      wait for 20 ns;
		D <= "0000";
      wait;
   end process;

END;
