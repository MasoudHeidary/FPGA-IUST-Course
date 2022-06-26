library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity StepperMotor is
    Port ( AntiClockWise : in  STD_LOGIC;
           FullStep : in  STD_LOGIC;
           En : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           A1 : out  STD_LOGIC;
           A2 : out  STD_LOGIC;
           B1 : out  STD_LOGIC;
           B2 : out  STD_LOGIC);
end StepperMotor;

architecture Behavioral of StepperMotor is
    type state_type is (D0, D1, D2, D3, D4, D5, D6, D7);
    signal state: state_type := D0;
    signal out_t: STD_LOGIC_VECTOR (3 downto 0);
begin
    A1 <= out_t(0);
    A2 <= out_t(2);
    B1 <= out_t(1);
    B2 <= out_t(3);

    -- STATE process
    process (clk, En)
    begin
        -- change state by clk
        if rising_edge(clk) and En='1' then
            case state is
                when D0 =>
                    if FullStep = '1' then
                        if AntiClockWise = '0' then
                            state <= D2;
                        else
                            state <= D6;
                        end if;
                    else
                        if AntiClockWise = '0' then
                            state <= D1;
                        else
                            state <= D7;
                        end if;
                    end if;

                when D1 =>
                    if FullStep = '1' then
                        if AntiClockWise = '0' then
                            state <= D2;
                        else
                            state <= D0;
                        end if;
                    else
                        if AntiClockWise = '0' then
                            state <= D2;
                        else
                            state <= D0;
                        end if;
                    end if;
                    
                when D2 => 
                    if FullStep = '1' then
                        if AntiClockWise = '0' then
                            state <= D4;
                        else
                            state <= D0;
                        end if;
                    else
                        if AntiClockWise = '0' then
                            state <= D3;
                        else
                            state <= D1;
                        end if;
                    end if;

                when D3 => 
                    if FullStep = '1' then
                        if AntiClockWise = '0' then
                            state <= D4;
                        else
                            state <= D2;
                        end if;
                    else
                        if AntiClockWise = '0' then
                            state <= D4;
                        else
                            state <= D2;
                        end if;
                    end if;

                when D4 => 
                    if FullStep = '1' then
                        if AntiClockWise = '0' then
                            state <= D6;
                        else
                            state <= D2;
                        end if;
                    else
                        if AntiClockWise = '0' then
                            state <= D5;
                        else
                            state <= D3;
                        end if;
                    end if;

                when D5 => 
                    if FullStep = '1' then
                        if AntiClockWise = '0' then
                            state <= D6;
                        else
                            state <= D4;
                        end if;
                    else
                        if AntiClockWise = '0' then
                            state <= D6;
                        else
                            state <= D4;
                        end if;
                    end if;

                when D6 => 
                    if FullStep = '1' then
                        if AntiClockWise = '0' then
                            state <= D0;
                        else
                            state <= D4;
                        end if;
                    else
                        if AntiClockWise = '0' then
                            state <= D7;
                        else
                            state <= D5;
                        end if;
                    end if;

                when D7 => 
                    if FullStep = '1' then
                        if AntiClockWise = '0' then
                            state <= D0;
                        else
                            state <= D6;
                        end if;
                    else
                        if AntiClockWise = '0' then
                            state <= D0;
                        else
                            state <= D6;
                        end if;
                    end if;

            end case;
        end if;
    end process;

    -- change output based on state
    process (state)
    begin
        case state is
            when D0 =>
                out_t <= "1100";
            when D1 =>
                out_t <= "0100";
            when D2 =>
                out_t <= "0110";
            when D3 =>
                out_t <= "0010";
            when D4 =>
                out_t <= "0011";
            when D5 =>
                out_t <= "0001";
            when D6 =>
                out_t <= "1001";
            when D7 =>
                out_t <= "1000";
        end case;
    end process;

end Behavioral;

