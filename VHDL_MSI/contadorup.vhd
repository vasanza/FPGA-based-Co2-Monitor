
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contadorup is

port (clock, reset, Ld, En: in std_logic;
		Ent: in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(7 downto 0));
end contadorup;

architecture desarrollo of contadorup is
signal temp: std_logic_vector(7 downto 0);
begin
process(En)
	begin
	if reset='0' then temp<="00000000";
	elsif (clock'event and clock='1') then
		if (Ld='1' and En='1') then temp<=Ent;
			elsif En='1' then
				if temp="11111111" then temp<="00000000";
				else temp<=temp+1;
				end if;
		end if;
	end  if;
end process;
Q<=temp;
end desarrollo;