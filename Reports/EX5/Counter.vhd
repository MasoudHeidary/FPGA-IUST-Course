library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter is
    Port ( PreInput : in  STD_LOGIC_VECTOR (7 downto 0);
           Count : out  STD_LOGIC_VECTOR (7 downto 0);
           UpDown : in  STD_LOGIC;
           PreLoadEn : in  STD_LOGIC;
           PreResetEn : in  STD_LOGIC;
           Reset: in STD_LOGIC;
           Clk : in  STD_LOGIC;
           Interrupt : out  STD_LOGIC);
end Counter;

architecture Behavioral of Counter is

begin

process (Clk, Reset)
    variable reg: integer := 0;
begin

    if Reset = '1' then
        if PreLoadEn = '1' then
            reg := to_integer(unsigned(PreInput));
        elsif UpDown = '0' then 
            reg := 0;
        else
            reg := 255;
        end if;
    end if;

    -- instead of ___ if (Clk'Event and Clk = '1') then
    if rising_edge(Clk) and Reset = '0' then
        Interrupt <= '0';

        -- up routine
        if UpDown = '0' then
            reg := reg + 1;

            -- natural reset
            if reg > 255 then
                if PreLoadEn = '1' then
                    reg := to_integer(unsigned(PreInput));
                else
                    reg := 0;
                end if ;

                Interrupt <= '1';

            -- pre reset en
            elsif PreResetEn = '1' then
                if reg = to_integer(unsigned(PreInput)) then
                    reg := 0;
                    Interrupt <= '1';
                end if ;
            end if ;

        -- down routine
        else
            reg := reg - 1;
            
            -- natural reset
            if reg < 0 then
                if PreLoadEn = '1' then
                    reg := to_integer(unsigned(PreInput));
                else
                    reg := 255;
                end if ;

                Interrupt <= '1';

            -- pre reset en
            elsif PreResetEn = '1' then
                if reg = to_integer(unsigned(PreInput)) then
                    reg := 255;
                    Interrupt <= '1';
                end if ;
            end if ;

        end if;

    end if ;

    -- set output
    Count <= std_logic_vector(to_unsigned(reg, 8));
end process;

end Behavioral;

