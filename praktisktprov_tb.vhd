----------------------------------------
-- Testbänk
-- Omtenta 
-- Praktiskt prov VHDL Digitalteknik
-- Mathias Hamlet
-- Ei22 
-- 
-- 2023-08-28
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity praktisktprov_tb is 
end entity;

architecture praktisktprov_tb_arch of praktisktprov_tb is

   component praktisktprov port ( clk                       : in std_logic;
                                  rst                       : in std_logic;
                                  newmsg                    : in std_logic;
                                  expmsg                    : in std_logic;
                                  numofmsgs                 : out unsigned(3 downto 0)
                                 );
   end component;

   signal clk_tb                                : std_logic := '0';
   signal rst_tb                                : std_logic := '0';
   signal newmsg_tb                             : std_logic := '0';
   signal expmsg_tb                             : std_logic := '0';
   signal numofmsgs_tb                          : unsigned(3 downto 0);

 begin 
  
   DUT : entity work.praktisktprov port map( clk => clk_tb,
                                 rst => rst_tb,
                                 newmsg => newmsg_tb,
                                 expmsg => expmsg_tb,
                                 numofmsgs => numofmsgs_tb);
                                                     
   clock : process
     begin 
       for i in 0 to 800 loop 
       clk_tb <= not clk_tb;
       wait for 10 ns;
       end loop;
       wait;
   end process;

   STIM : process
     begin 
     
     rst_tb <= '0'; wait for 10 ns;
     rst_tb <= '1'; wait for 10 ns;
     
      for i in 0 to 15 loop 
       newmsg_tb <= '1';
       wait for 50 ns;
       newmsg_tb <= '0';
       wait for 50 ns;
       end loop;
       
      for i in 0 to 2 loop 
       newmsg_tb <= '1';
       expmsg_tb <= '1';
       wait for 50 ns;
       newmsg_tb <= '0';
       expmsg_tb <= '0';
       wait for 50 ns;
       end loop;
      
       
      for i in 0 to 17 loop 
       expmsg_tb <= '1';
       wait for 50 ns;
       expmsg_tb <= '0';
       wait for 50 ns;
       end loop;
       wait;
     
     wait;
 
   end process;
                                                     
                                                     
                                                   
end architecture;                                                 
                                               
                                               