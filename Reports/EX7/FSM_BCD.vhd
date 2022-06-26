library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FSM_BCD is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end FSM_BCD;

architecture Behavioral of FSM_BCD is
    type state_type is (D0, D1, D2, D3, D4, D5, D6, D7, D8, D9);
    signal state: state_type := D0;
begin

    -- STATE process
    process (clk, reset)
    begin
        -- reset pin config
        if reset = '1' then
            state <= D0;

        -- change state by clk
        elsif rising_edge(clk) then
            case state is
                when D0 =>
                    state <= D1;
                when D1 =>
                    state <= D2;
                when D2 => 
                    state <= D3;
                when D3 => 
                    state <= D4;
                when D4 => 
                    state <= D5;
                when D5 => 
                    state <= D6;
                when D6 => 
                    state <= D7;
                when D7 => 
                    state <= D8;
                when D8 => 
                    state <= D9;
                when D9 => 
                    state <= D0;
            end case;
        end if;
    end process;

    -- change output based on state
    process (state)
    begin
        case state is
            when D0 =>
                output <= "0000";
            when D1 =>
                output <= "0001";
            when D2 => 
                output <= "0010";
            when D3 =>
                output <= "0011";
            when D4 => 
                output <= "0100";
            when D5 =>
                output <= "0101";
            when D6 =>
                output <= "0110";
            when D7 =>
                output <= "0111";
            when D8 =>
                output <= "1000";
            when D9 =>
                output <= "1001";
        end case;
    end process;


end Behavioral;

