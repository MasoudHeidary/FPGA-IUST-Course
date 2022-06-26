library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Register8Bit is
    Port ( Din : in  STD_LOGIC_VECTOR (7 downto 0);
           Load : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (7 downto 0));
end Register8Bit;

architecture Behavioral of Register8Bit is
-- signal reg: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
begin

process (Clk)
    variable reg: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
begin
    if (Clk'Event and Clk = '1') then
        if Reset = '1' then
            reg := "00000000";
        elsif Load = '1' then
            reg := Din;
        end if;
    end if;

    Dout <= reg;
end process;


end Behavioral;

