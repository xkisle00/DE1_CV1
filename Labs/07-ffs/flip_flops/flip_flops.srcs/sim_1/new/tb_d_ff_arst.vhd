
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_d_ff_arst is

    
end tb_d_ff_arst;

architecture Behavioral of tb_d_ff_arst is

    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    signal s_clk_100MHz : std_logic;
    
    signal  s_arst   : std_logic; 
    signal  s_d      : std_logic;
    signal  s_q      : std_logic;
    signal  s_q_bar  : std_logic; 
    
begin
    uut_d_ff_arst: entity work.d_ff_arst
    port map(
         clk    => s_clk_100MHz,  
         arst  => s_arst, 
         d     => s_d, 
         q     => s_q, 
         q_bar => s_q_bar 
    );
    
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
    
end Behavioral;
