library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;
 
--Entity
entity decopfin is
   port(
		state1: in std_logic;
		num: in std_logic_vector(7 downto 0);
		
		ini: out std_logic_vector(7 downto 0);
		
		fin: out std_logic_vector(7 downto 0));
end decopfin;

--Architecture
architecture solve of decopfin is
	-- Signals,Constants,Variables,Components
	 begin
	 
	if state1='1' then ini<="00000000";
	else ini<="11111111"
				end if;
 		
		
end solve;