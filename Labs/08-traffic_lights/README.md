## Preparation tasks (done before the lab at home)

Fill in the table with the state names and output values accoding to the given inputs. Let the reset has just been applied.

| **Input P** | `0` | `0` | `1` | `1` | `0` | `1` | `0` | `1` | `1` | `1` | `1` | `0` | `0` | `1` | `1` | `1` |
| :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Clock** | ↑ | ↑ | ↑ | ↑ | ↑ | ↑ | ↑ | ↑ | ↑ | ↑ | ↑ | ↑ | ↑ | ↑ | ↑ | ↑ |
| **State** | A | A | B | C | C | D | A | B | C | D | B | B | B | C | D | B |
| **Output R** | `0` | `0` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `0` | `1` | `0` |

<br>

### connection of RGB

| **RGB LED** | **Artix-7 pin names** | **Red** | **Yellow** | **Green** |
| :-: | :-: | :-: | :-: | :-: |
| LD16 | N15, M16, R12 | `1,0,0` | `1,1,0`  | `0,1,0` |
| LD17 | N16, R11, G14 | `1,0,0` | `1,1,0`  | `0,1,0` |

![Schematic](Images/schematic.png)
<br>
<br>


## Part 2: Traffic light controller

### State diagram
![Schematic](Images/1.png)

&nbsp;
### Listing of VHDL code of sequential process p_traffic_fsm 
```vhdl
p_traffic_fsm : process(clk)
     begin
         if rising_edge(clk) then
            if (reset = '1') then       -- Synchronous reset
                s_state <= STOP1 ;      -- Set initial state
                s_cnt   <= c_ZERO;      -- Clear all bits

            elsif (s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                case s_state is

                    -- If the current state is STOP1, then wait 1 sec
                    -- and move to the next GO_WAIT state.
                    when STOP1 =>
                        -- Count up to c_DELAY_1SEC
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= WEST_GO;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;

                    when WEST_GO =>
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= WEST_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;
                            
                    when WEST_WAIT =>
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= STOP2;
                            s_cnt   <= c_ZERO;
                        end if;    
                            
                     when STOP2 =>
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= SOUTH_GO;
                            s_cnt   <= c_ZERO;
                        end if;    
                            
                     when SOUTH_GO =>
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= SOUTH_WAIT;
                            s_cnt   <= c_ZERO; 
                        end if;    

                     when SOUTH_WAIT =>
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= STOP1;
                            s_cnt   <= c_ZERO; 
                        end if;    

                    when others =>
                        s_state <= STOP1;

                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_traffic_fsm;
```
&nbsp;

### Listing of VHDL code of combinatorial process p_output_fsm

```vhdl
p_output_fsm : process(s_state)
    begin
        case s_state is
            when STOP1 =>
                south_o <= c_RED;
                west_o  <= c_RED;
            when WEST_GO =>

                south_o <= c_RED;
                west_o  <= c_GREEN;
            when WEST_WAIT =>
                south_o <= c_RED;
                west_o  <= c_YELLOW;
            when STOP2 =>
                south_o <= c_RED;
                west_o  <= c_RED;
            when SOUTH_GO =>
                south_o <= c_YELLOW;
                west_o  <= c_RED;
            when SOUTH_WAIT =>  
                south_o <= c_YELLOW;
                west_o  <= c_RED;                  
            when others =>
                south_o <= c_RED;
                west_o  <= c_RED;
        end case;
    end process p_output_fsm;

```
![Simulation](Images/2.png)
![Simulation](Images/3.png)
&nbsp;
## Part 3: Smart controller
&nbsp;
### State table
| **Current state** | **Direction South** | **Direction West** | **Delay** | **CAR sensor WEST/SOUTH** |
| :-- | :-: | :-: | :-: | :-: |
| `STOP1`      | red    | red | 1 sec | =>`WEST_GO` |
| `WEST_GO`    | red    | green | 4 sec | `10`=>`WEST_GO`;  `01`=>`STOP2`; `00`=>`STOP1` |
| `WEST_WAIT`  | red    | yellow | 2 sec | =>`STOP2` |
| `STOP2`      | red    | red | 1 sec | =>`SOUTH_GO` |
| `SOUTH_GO`   | green  | red | 4 sec | `01`=>`SOUTH_GO`;  `10`=>`STOP1`; `00`=>`STOP1` |
| `SOUTH_WAIT` | yellow | red | 2 sec | =>`STOP1` |

&nbsp;

&nbsp;

