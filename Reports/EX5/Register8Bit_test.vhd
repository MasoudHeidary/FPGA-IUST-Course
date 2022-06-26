LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY Register8Bit_test IS
END Register8Bit_test;
 
ARCHITECTURE behavior OF Register8Bit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register8Bit
    PORT(
         Din : IN  std_logic_vector(7 downto 0);
         Load : IN  std_logic;
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Dout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Din : std_logic_vector(7 downto 0) := (others => '0');
   signal Load : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Dout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register8Bit PORT MAP (
          Din => Din,
          Load => Load,
          Reset => Reset,
          Clk => Clk,
          Dout => Dout
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
      Load <= '0';
      Reset <= '0';	
      wait for Clk_period;

      Din <= "11110000";
      Load <= '1';
      wait for Clk_period;

      Load <= '0';
      wait for Clk_period;
      
      Reset <= '1';
      wait for Clk_period;

      Reset <= '0';
      wait for Clk_period;

      wait;
   end process;

END;
