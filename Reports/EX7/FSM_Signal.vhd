library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FSM_Signal is
    Port ( clk : in  STD_LOGIC;
           output : out  STD_LOGIC);
end FSM_Signal;

architecture Behavioral of FSM_Signal is
    type state_type is (S0, S1, S2, S3, S4);
    signal state: state_type := S4;
begin

    process (clk)
    begin
        if rising_edge(clk) then
            case state is
                when S0 =>
                    state <= S1;
                when S1 =>
                    state <= S2;
                when S2 =>
                    state <= S3;
                when S3 =>
                    state <= S4;
                when S4 =>
                    state <= S0;
            end case;
        end if;
    end process;

    -- change output based on state
    process (state)
    begin
        case state is
            when S0 =>
                output <= '1';
            when S1 => 
                output <= '0';
            when S2 => 
                output <= '1';
            when S3 => 
                output <= '0';
            when S4 =>
                output <= '0';
            end case;
    end process;

end Behavioral;

