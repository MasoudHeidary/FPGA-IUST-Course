LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY FSM_BCD_test IS
END FSM_BCD_test;
 
ARCHITECTURE behavior OF FSM_BCD_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM_BCD
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM_BCD PORT MAP (
          clk => clk,
          reset => reset,
          output => output
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
      wait for clk_period;
      wait for clk_period;
      wait for clk_period;
      wait for clk_period;
      wait for clk_period;
      
      reset <= '1';
      wait for clk_period;
      wait for clk_period;
      wait for clk_period;

      reset <= '0';
      wait for clk_period;


      -- insert stimulus here 

      wait;
   end process;

END;
