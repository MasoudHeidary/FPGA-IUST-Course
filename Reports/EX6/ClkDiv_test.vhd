LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY ClkDiv_test IS
END ClkDiv_test;
 
ARCHITECTURE behavior OF ClkDiv_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ClkDiv
    PORT(
         Clk50MHz : IN  std_logic;
         Freq : IN  std_logic_vector(19 downto 0);
         Duty : IN  std_logic_vector(7 downto 0);
         ClkOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk50MHz : std_logic := '0';
   signal Freq : std_logic_vector(19 downto 0) := (others => '0');
   signal Duty : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal ClkOut : std_logic;

   -- Clock period definitions
   constant Clk50MHz_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ClkDiv PORT MAP (
         Clk50MHz => Clk50MHz,
          Freq => Freq,
          Duty => Duty,
          ClkOut => ClkOut
        );

   -- Clock process definitions
   Clk50MHz_process :process
   begin
		Clk50MHz <= '0';
		wait for Clk50MHz_period/2;
		Clk50MHz <= '1';
		wait for Clk50MHz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      Freq <= "00011000011010100000";
      Duty <= "11001000";
      wait for 10 ns;

      -- 

      wait;
   end process;

END;
