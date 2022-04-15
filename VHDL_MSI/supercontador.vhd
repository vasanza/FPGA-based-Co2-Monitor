
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity supercontador is

port (clock, reset, Ld,Ldj,En,Enj: in std_logic;
		Ent: in std_logic_vector(7 downto 0);
		
		Q: out std_logic_vector(7 downto 0);
		Qj: out std_logic_vector(7 downto 0));
end supercontador;

architecture desarrollo2 of supercontador is
signal temp: std_logic_vector(7 downto 0);
signal tempj: std_logic_vector(7 downto 0);
begin
process(En)
	begin
	if reset='1' then temp<="00000000";
	elsif (clock'event and clock='1') then
		if (Ld='1' and En='1') then temp<=Ent;
			elsif En='1' then
				if temp="11111111" then temp<="00000000";
				else temp<=temp+1;
				end if;
		end if;
	end  if;
	
	if reset='1' then tempj<="00000000";
	elsif (clock'event and clock='1') then
		if (Ldj='1' and Enj='1') then tempj<=temp+1;
			elsif Enj='1' then
				if tempj="11111111" then tempj<="00000000";
				else tempj<=tempj+1;
				end if;
		end if;
	end  if;
	
	
end process;
Q<=temp;
Qj<=tempj;
end desarrollo2;