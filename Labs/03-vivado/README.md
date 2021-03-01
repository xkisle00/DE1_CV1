# **Lab 3: Introduction to Vivado**

## 1. Preparation tasks :

#### Table with connection of 16 slide switches and 16 LEDs on Nexys A7 board :

| **LED** | **Connection** | **Switch** | **Connection** | 
| :-: | :-: | :-: | :-: |
| LED0 | H17 | SW0 | J15 |
| LED1 | K15 | SW1 | L16 |
| LED2 | J13 | SW2 | M13 |
| LED3 | N14 | SW3 | R15 |
| LED4 | R18 | SW4 | R17 |
| LED5 | V17 | SW5 | T18 |
| LED6 | U17 | SW6 | U18 |
| LED7 | U16 | SW7 | R13 |
| LED8 | V16 | SW8 | T8 |
| LED9 | T15 | SW9 | U8 |
| LED10 | U14 | SW10 | R16 |
| LED11 | T16 | SW11 | T13 |
| LED12 | V15 | SW12 | H6 |
| LED13 | V14 | SW13 | U12 |
| LED14 | V12 | SW14 | U11 |
| LED15 | V11 | SW15 | V10 |

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

## 3. A Vivado tutorial :
Po otvorení Vivado zvolíme cestu **file -> project -> new** a otvorí sa nám nasledovné okno.
![error](/obrazky/new_project.png)
Zvolíme **next**.
![error](/obrazky/project_name.png)
Zvolíme si **názov** nášho projektu a **lokáciu** kde sa nám daný projekt bude nachádzať.
Následne zvolíme znovu **next**.
![error](/obrazky/project_type.png)
Musíme dbať na to aby sme mali zvolený **RTL project** a zvolíme **next**.
![error](/obrazky/project_sources.png)
V tomto okne musíme dohliadnúť aby sme mali zvolený **target language** a **simulation language** ako **VHDL**,zvolíme **next**.
Ak máme oba zvolené za VHDL možeme prejsť k vytvoreniu **source file** a to tak že klikneme na tlačítko **Create File** a zobrazí sa nám nasledovné okno :
![error](/obrazky/project_create_sources.png)
Za **file type** zvolíme **VHDL** a zadáme **File name** podla potreby a následne klikneme tlačidlo **OK**.
Malo by to vyzerať nasledovne:
![error](/obrazky/project_creatd_sources.png)
Zvolíme **next**.
![error](/obrazky/project_constrains.png)
V ďalšom okne máme možnosť pridať **constrains** ak chceme, nieje to však nutnosť pretože tento súbor vieme pridať aj neskor po vytvorení projektu. Zvolíme teda **next**.
V nasledujúcom okne klikneme na **boards** a vyberieme dosku ktorú potrebujeme.
![error](/obrazky/project_boards.png)
ako posledné zvolíme **Next** a ďalšie okno nás oboznámi so sumarizáciou vytvoreného projektu a môžme zvoliť **Finish**.











