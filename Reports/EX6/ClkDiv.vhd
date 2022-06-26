library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ClkDiv is
    Port ( Clk50MHz : in  STD_LOGIC;
           Freq : in  STD_LOGIC_VECTOR (19 DOWNTO 0);
           Duty : in  STD_LOGIC_VECTOR (7 DOWNTO 0);
           ClkOut : out  STD_LOGIC);
end ClkDiv;

architecture Behavioral of ClkDiv is
    COMPONENT ClkDiv_DCM
	PORT(
		CLKIN_IN : IN std_logic;          
		CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic
		);
	END COMPONENT;

    signal Clk20MHz: STD_LOGIC;
begin

    Inst_ClkDiv_DCM: ClkDiv_DCM PORT MAP(
		CLKIN_IN => Clk50MHz,
		CLKFX_OUT => Clk20MHz,
		CLKIN_IBUFG_OUT => open
	);

process(Clk20MHz)
    variable counter: integer := 0;

    variable clk_state: STD_LOGIC := '0';
begin
    if rising_edge(Clk20MHz) then
        counter := counter + 1;

        -- create clk period
        if counter * to_integer(unsigned(Freq)) = 20_000_000 then
            clk_state := '1';
            counter := 0;
        end if;

        -- create duty cycle
        if counter * to_integer(unsigned(Freq)) / 256 * to_integer(unsigned(Duty)) >= 10_000_000 then
            clk_state := '0';
        end if;

        ClkOut <= clk_state;
    end if;
end process;

end Behavioral;
