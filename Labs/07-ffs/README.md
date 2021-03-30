# 7. Lab assignment

## 1. Preparation tasks :
#### Characteristic equations and completed tables for D, JK, T flip-flops :

   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 0 | 0 | Sampled and stored |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 1 | 0 | Sampled and stored |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 0 | 1 | Sampled and stored |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 1 | 1 | Sampled and stored |

   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 0 | 0 | 0 | No change |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 0 | 1 | 1 | No change |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 1 | 0 | 0 | Reset |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 1 | 1 | 0 | Reset |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 0 | 0 | 1 | Set |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 0 | 1 | 1 | Set |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 1 | 0 | 1 | Toggle (=invert) |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 1 | 1 | 0 | Toggle (=invert) |

   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 0 | 0 | No change |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 1 | 1 | No change |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 0 | 1 | Toggle (=invert) |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 1 | 0 | Toggle (=invert) |


## 2. D latch :
#### VHDL code listing of the process `p_d_latch` with syntax highlighting :
```vhdl 

    p_d_latch : process (d, arst, en)
    begin
        if(arst = '1' ) then
            q       <= '0';
            q_bar   <= '1';
        
        elsif (en = '1') then
            q       <= d;
            q_bar   <= not d;
        
        end if;
    end process p_d_latch;
    
```
#### Listing of VHDL reset and stimulus processes from the testbench `tb_d_latch` file with syntax highlighting and asserts :
```vhdl
    
    p_reset_gen : process
    begin
        s_arst <= '0';
        wait for 38 ns;
        
        s_arst <= '1';
        wait for 53 ns;

        s_arst <= '0';
        wait for 100 ns;
        
        s_arst <= '1';
        
        wait;
    end process p_reset_gen;

    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        s_d      <= '0';
        s_en     <= '0';
        
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0';
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0';
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0';

	assert ((s_arst = '1') and (s_en = '0') and (s_q = '0') and (s_q_bar = '1'))
	report "Test failed " severity error;
	
        s_en     <= '1';
        
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0';
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0';
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_en     <= '0';        -- en to 0 
        wait for 100 ns;
        s_d      <= '0';

	assert ((s_arst = '1') and (s_en = '0') and (s_q = '0') and (s_q_bar = '1'))
	report "Test failed " severity error;        
        
        
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0';
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0';
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0';    
        
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0';
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0';
        wait for 10 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0'; 
        
                           
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
    
```
#### Screenshot with simulated time waveforms; always display all inputs and outputs. The full functionality of the entity must be verified.
![screenshot](/obrazky/cv7_screen1.png)

## 3. Flip-flops :
#### VHDL code listing of the processes `p_d_ff_arst` :
```vhdl
    p_d_ff_arst : process (clk, arst)   
    begin                               
                                        
        if(arst = '1' ) then            
            q       <= '0';             
            q_bar   <= '1';             
                                        
        elsif rising_edge(clk) then     
            q       <= d;               
            q_bar   <= not d;           
                                        
        end if;                         
     end process p_d_ff_arst;           
```
#### VHDL code listing of the processes `p_d_ff_rst` :
```vhdl

```

#### VHDL code listing of the processes `p_jk_ff_rst` :
```vhdl

```

#### VHDL code listing of the processes `p_t_ff_rst` :
```vhdl

```

#### VHDL code listing of the processes `p_d_ff_arst`
```vhdl

```


#### Listing of VHDL clock, reset and stimulus processes from the testbench files with syntax highlighting and asserts :
```vhdl

```
#### Screenshot, with simulated time waveforms :
![screenshot](/obrazky/cv7_screen2.png)

## 4. Shift register :
#### Image of the shift register schematic :
![obrazok](/obrazky/cv7_nakreslene.jpg)
