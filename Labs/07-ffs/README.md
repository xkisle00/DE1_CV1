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
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 1 | 0 | 1 | Toggle |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 1 | 1 | 0 | Toggle |

   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 0 | 0 | No change |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 1 | 1 | No change |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 0 | 1 | Toggle |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 1 | 0 | Toggle |


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
    p_d_ff_rst : process (clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                q <= '0';
                q_bar <= '1';
            else
                q <= d;
                q_bar <= not d;
            end if;
        end if;
    end process p_d_ff_rst;
```

#### VHDL code listing of the processes `p_jk_ff_rst` :
```vhdl
    p_jk_ff_rst : process (clk)
    begin                            
        if rising_edge(clk) then
            if (rst = '1' ) then         
                s_q     <= '0';          
            else
                if (j = '0' and k = '0') then
                    s_q <= s_q;
                    
                elsif (j = '0' and k = '1') then
                    s_q <= '0';
                    
                elsif (j = '1' and k = '0') then
                    s_q <= '1';
                    
                elsif (j = '1' and k = '1') then
                    s_q <= not s_q;
                
                end if;   
                       
            end if;                         

        end if;        
     end process p_jk_ff_rst;  

    q       <= s_q;
    q_bar   <= not s_q; 
    
```

#### VHDL code listing of the processes `p_t_ff_rst` :
```vhdl
   p_t_ff_rst : process (clk)
      begin
        if rising_edge(clk) then
            if (rst = '1') then
                s_q <= '0';
            elsif (t = '1') then
                s_q <= not s_q;
            end if;
        end if;
    
   end process p_t_ff_rst;
    
    q <= s_q;
    q_bar <= not s_q;       
```

#### Listing of VHDL clock, reset and stimulus processes from the `tb_d_ff_arst` :
```vhdl
    
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                           -- Process is suspended forever
    end process p_clk_gen;
   
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_arst<= '0';
        wait for 28 ns;
        
        -- Reset activated
        s_arst <= '1';
        wait for 13 ns;

        -- Reset deactivated
        s_arst <= '0';
         
        wait for 17 ns;
        s_arst <= '1';
        
        wait for 33 ns;
        s_arst <= '0';
        
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_d      <= '0';
        
        wait for 14 ns;
        s_d      <= '1';
        wait for 10 ns;
        s_d      <= '0';
        
        wait for 6 ns;
        
        assert ((s_arst = '1') and (s_q = '0') and (s_q_bar = '1'))
	    report "Test failed " severity error;
	    
        wait for 4 ns;
    
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
#### Listing of VHDL clock, reset and stimulus processes from the `tb_d_ff_rst` :
```vhdl
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 40 ms loop        
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    
     p_reset_gen : process
        begin
            s_rst <= '0';
            wait for 28 ns;
            
            -- Reset activated
            s_rst <= '1';
            wait for 13 ns;
    
            --Reset deactivated
            s_rst <= '0';
            
            wait for 17 ns;
            
            s_rst <= '1';
            wait for 33 ns;
            
            wait for 660 ns;
            s_rst <= '1';
    
            wait;
     end process p_reset_gen;

--------------------------------------------------------------------
-- Data generation process
--------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_d  <= '0';
        
        wait for 14 ns;
        s_d  <= '1';
        wait for 2 ns;
        
        assert ((s_rst = '0') and (s_q = '1') and (s_q_bar = '0'))
        report "Test failed" severity error;
        
        wait for 8 ns;
        s_d  <= '0';
        wait for 6 ns;
        
        wait for 4 ns;
        s_d  <= '1';
        wait for 10 ns;
        s_d  <= '0';
        wait for 10 ns;
        s_d  <= '1';
        wait for 5 ns;
        
        assert ((s_rst = '1') and (s_q = '1') and (s_q_bar = '0'))
        report "Test failed" severity error;
        
        wait for 5 ns;
        s_d  <= '0';
        
        wait for 14 ns;
        s_d  <= '1';
        wait for 10 ns;
        s_d  <= '0';
        wait for 10 ns;
        s_d  <= '1';
        wait for 10 ns;
        s_d  <= '0';
        wait for 10 ns;
        s_d  <= '1';
        wait for 10 ns;
        s_d  <= '0';
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
   
```

#### Listing of VHDL clock, reset and stimulus processes from the `tb_jk_ff_rst` :
```vhdl
   --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                           -- Process is suspended forever
    end process p_clk_gen;
   
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_rst<= '0';
        wait for 28 ns;
        
        -- Reset activated
        s_rst <= '1';
        wait for 13 ns;

        -- Reset deactivated
        s_rst <= '0';
         
        wait for 17 ns;
        s_rst <= '1';
        
        wait for 33 ns;
        s_rst <= '0';
        
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_j      <= '0';
        s_k      <= '0';
        
        wait for 37 ns;
        s_j      <= '0';
        s_k      <= '0';
        wait for 3 ns;
        s_j      <= '1';
        s_k      <= '0';
        wait for 7 ns;
        s_j      <= '0';
        s_k      <= '1';
        
        wait for 10   ns;
        
        assert ((s_rst = '0') and (s_q = '1') and (s_q_bar = '0'))
	    report "Test failed " severity error;
	    
        wait for 4 ns;
    
        s_j      <= '1';
        s_k      <= '0';
        
        wait for 4 ns;
        
        assert ((s_rst = '1') and (s_q = '0') and (s_q_bar = '1'))
	    report "Test failed " severity error;
	    
	    wait for 3 ns;
	    
        s_j      <= '1';
        s_k      <= '1';
        wait for 7 ns;

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

#### Listing of VHDL clock, reset and stimulus processes from the `tb_t_ff_rst` :
```vhdl
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 40 ms loop        
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    
     p_reset_gen : process
        begin
            s_rst <= '0';
            wait for 18 ns;
            
            -- Reset activated
            s_rst <= '1';
            wait for 14 ns;
    
            --Reset deactivated
            s_rst <= '0';
            
            wait for 47 ns;
            
            s_rst <= '1';
            wait for 33 ns;
            
            wait for 120 ns;
            s_rst <= '1';
    
            wait;
     end process p_reset_gen;
    
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_t  <= '0';
        
        wait for 38 ns;
        
        assert ((s_rst = '0') and (s_t = '0') and (s_q = '0') and (s_q_bar = '1'))
        report "Test failed" severity error;
        
        wait for 2 ns;
        s_t  <= '1';
        wait for 6 ns;
        
        assert ((s_rst = '0') and (s_t = '1') and (s_q = '1') and (s_q_bar = '0'))
        report "Test failed" severity error;
        
        wait for 1 ns;
        s_t  <= '0';
        wait for 13 ns;
        
        assert ((s_rst = '0') and (s_t = '0') and (s_q = '1') and (s_q_bar = '0'))
        report "Test failed" severity error;
        
        wait for 1 ns;
        s_t  <= '1';
        wait for 5 ns;
        
        assert ((s_rst = '0') and (s_t = '1') and (s_q = '0') and (s_q_bar = '1'))
        report "Test failed" severity error;
        
        wait for 12 ns;
        s_t  <= '0';
        wait for 7 ns;
        s_t  <= '1';
        wait for 9 ns;
        s_t  <= '0';
        wait for 7 ns;
        s_t  <= '1';
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```
#### Screenshot, with simulated time waveforms :
![screenshot](/obrazky/cv7_screen_arst.png)
![screenshot](/obrazky/cv7_screen_d_rst.png)
![screenshot](/obrazky/cv7_screen_jk_rst.png)
![screenshot](/obrazky/cv7_screen_t_rst.png)

## 4. Shift register :
#### Image of the shift register schematic :
![obrazok](/obrazky/cv7_nakreslene.jpg)
