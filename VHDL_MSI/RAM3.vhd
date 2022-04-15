--Library
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

--Entity
entity RAM3 is 
	generic(n: integer:=8;-- n-bits per data
	m: integer:=8); -- m-bits of addresses
	port(
		clk,wr,d: in std_logic; 
		addr : in std_logic_vector(m-1 downto 0); 
		Din : in std_logic_vector(15 downto 0);
		Dout : out std_logic_vector((2*n)-1 downto 0); 
		id : in std_logic_vector(m-1 downto 0));
		
end RAM3;

--Architecture
architecture solve of RAM3 is
	-- Signals,Constants,Variables,Components	
	type ram_type is array (0 to (2**m)-1) of std_logic_vector((2*n)-1 downto 0); 
	signal tmp_ram: ram_type;
	signal temp :std_logic_vector((2*n)-1 downto 0);
	 
	begin
	--Process #1:
	process(clk,wr)
	--Sequential programming
		begin 
			if (clk'event and clk='1') then 
				if (wr='1' and d='0') then --write
					temp(7 downto 0)<= Din(7 downto 0);
					temp(15 downto 8)<= id;
					tmp_ram(conv_integer(addr)) <= temp;
					end if;
					
				if	(wr='1' and d='1') then
					tmp_ram(conv_integer(addr)) <= Din; end if;
					
				
			end if; 
	end process; 
	Dout <= tmp_ram(conv_integer(addr));--read
	
	--Process #n...
end solve;