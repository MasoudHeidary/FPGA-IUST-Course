LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY Counter_test IS
END Counter_test;
 
ARCHITECTURE behavior OF Counter_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter
    PORT(
         PreInput : IN  std_logic_vector(7 downto 0);
         Count : OUT  std_logic_vector(7 downto 0);
         UpDown : IN  std_logic;
         PreLoadEn : IN  std_logic;
         PreResetEn : IN  std_logic;
         Reset: in STD_LOGIC;
         Clk : IN  std_logic;
         Interrupt : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PreInput : std_logic_vector(7 downto 0) := (others => '0');
   signal UpDown : std_logic := '0';
   signal PreLoadEn : std_logic := '0';
   signal PreResetEn : std_logic := '0';
   signal Reset: std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Count : std_logic_vector(7 downto 0);
   signal Interrupt : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter PORT MAP (
          PreInput => PreInput,
          Count => Count,
          UpDown => UpDown,
          PreLoadEn => PreLoadEn,
          PreResetEn => PreResetEn,
          Reset => Reset,
          Clk => Clk,
          Interrupt => Interrupt
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- UpDown <= '0';
      
      -- -----------------------------------------------------------------------
      -- UpDown <= '0';
      -- PreInput <= "00001111";
      -- PreResetEn <= '1';

      -- -----------------------------------------------------------------------
      -- UpDown <= '0';
      -- PreInput <= "00001111";
      -- PreLoadEn <= '1';

      -- -----------------------------------------------------------------------
      -- UpDown <= '0';
      -- wait for Clk_period;
      -- wait for Clk_period;
      -- wait for Clk_period;
      -- wait for Clk_period;
      
      -- Reset <= '1';
      -- wait for Clk_period;
      
      -- Reset <= '0';
      -- wait for Clk_period;
      
      -- -----------------------------------------------------------------------
      -- UpDown <= '0';
      -- PreInput <= "00001111";
      -- PreLoadEn <= '1';
      -- wait for Clk_period;
      -- wait for Clk_period;
      -- wait for Clk_period;
      -- wait for Clk_period;
      
      -- Reset <= '1';
      -- wait for Clk_period;
      
      -- Reset <= '0';
      -- wait for Clk_period;

      -- -----------------------------------------------------------------------
      -- UpDown <= '1';
      -- wait for Clk_period;
      -- wait for Clk_period;
      -- wait for Clk_period;
      -- wait for Clk_period;
      
      -- Reset <= '1';
      -- wait for Clk_period;
      
      -- Reset <= '0';
      -- wait for Clk_period;

      -- -----------------------------------------------------------------------
      -- UpDown <= '1';

      -- -----------------------------------------------------------------------
      -- UpDown <= '1';
      -- PreInput <= "11110000";
      -- PreResetEn <= '1';

      -- -----------------------------------------------------------------------
      -- UpDown <= '1';
      -- PreInput <= "00001111";
      -- PreLoadEn <= '1';
      -- -----------------------------------------------------------------------

      -- -----------------------------------------------------------------------

      wait;
   end process;

END;
