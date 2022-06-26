LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY test_StepperMotor IS
END test_StepperMotor;
 
ARCHITECTURE behavior OF test_StepperMotor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT StepperMotor
    PORT(
         AntiClockWise : IN  std_logic;
         FullStep : IN  std_logic;
         En : IN  std_logic;
         clk : IN  std_logic;
         A1 : OUT  std_logic;
         A2 : OUT  std_logic;
         B1 : OUT  std_logic;
         B2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal AntiClockWise : std_logic := '0';
   signal FullStep : std_logic := '0';
   signal En : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal A1 : std_logic;
   signal A2 : std_logic;
   signal B1 : std_logic;
   signal B2 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: StepperMotor PORT MAP (
          AntiClockWise => AntiClockWise,
          FullStep => FullStep,
          En => En,
          clk => clk,
          A1 => A1,
          A2 => A2,
          B1 => B1,
          B2 => B2
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
      En <= '0';
      wait for clk_period*5;

      En <= '1';
      wait for clk_period*50;

      AntiClockWise <= '1';
      wait for clk_period*50;

      FullStep <= '1';
      AntiClockWise <= '0';
      wait for clk_period*50;
      
      AntiClockWise <= '1';
      wait for clk_period*50;

      wait;
   end process;

END;
