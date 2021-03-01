# **Lab 3: Introduction to Vivado**

## 1. Preparation tasks :

#### Table with connection of 16 slide switches and 16 LEDs on Nexys A7 board :

| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 0 | 0 0 | 0 | 1 | 0 |
| 1 | 0 0 | 0 1 | 0 | 0 | 1 |
| 2 | 0 0 | 1 0 | 0 | 0 | 1 |
| 3 | 0 0 | 1 1 | 0 | 0 | 1 |
| 4 | 0 1 | 0 0 | 1 | 0 | 0 |
| 5 | 0 1 | 0 1 | 0 | 1 | 0 |
| 6 | 0 1 | 1 0 | 0 | 0 | 1 |
| 7 | 0 1 | 1 1 | 0 | 0 | 1 |
| 8 | 1 0 | 0 0 | 1 | 0 | 0 |
| 9 | 1 0 | 0 1 | 1 | 0 | 0 |
| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
| 11 | 1 0 | 1 1 | 0 | 0 | 1 |
| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
| 14 | 1 1 | 1 0 | 1 | 0 | 0 |
| 15 | 1 1 | 1 1 | 0 | 1 | 0 |

## 2. Two-bit wide 4-to-1 multiplexer :

#### VHDL architecture from source file :
```vhdl
architecture Behavioral of mux_2bit_4to1 is
begin


    f_o      <= a_i when (sel_i = "00") else
                b_i when (sel_i = "01") else
                c_i when (sel_i = "10") else
                d_i;


end architecture Behavioral;
```

#### VHDL stimulus process from testbench file :
```vhdl
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;



        s_d <= "00"; s_c <= "00"; s_b <= "00";s_a <= "00";
        s_sel <= "00"; wait for 100 ns;
        
        s_a <= "01"; wait for 100 ns;
        s_b <= "01"; wait for 100 ns;
          
        s_sel <= "01"; wait for 100 ns;
        s_c <= "00"; wait for 100 ns;
        s_b <= "11"; wait for 100 ns;
        
         s_d <= "10"; s_c <= "11"; s_b <= "01";s_a <= "00";
         s_sel <= "01"; wait for 100 ns;
         s_sel <= "10"; wait for 100 ns;
         s_sel <= "11"; wait for 100 ns;
         
         s_d <= "01"; s_c <= "00"; s_b <= "00";s_a <= "01";
         s_sel <= "10"; wait for 100 ns;
         
         s_d <= "10"; s_c <= "11"; s_b <= "01";s_a <= "00";
         s_sel <= "11"; wait for 100 ns;
         
         s_a <= "11"; wait for 100 ns;
         s_b <= "10"; wait for 100 ns;
          
         s_sel <= "10"; wait for 100 ns;
         s_c <= "01"; wait for 100 ns;
         s_b <= "00"; wait for 100 ns;




        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

#### Screenshot with simulated time waveforms :
![error](/obrazky/DE1_CV3.png)
