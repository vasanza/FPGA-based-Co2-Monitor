library ieee;
use ieee.std_logic_1164.all;

entity sostenimiento8 is
port (clock, reset, En: in std_logic;
		Ent: in std_logic_vector(19 downto 0);
		Q: out std_logic_vector(19 downto 0));
end sostenimiento8;

architecture desarrollo of sostenimiento8 is
signal temp: std_logic_vector(19 downto 0);
begin
process(clock)
	begin
	if reset='1' then temp<="00000000000000000000";
	elsif (clock'event and clock='1') then
		if En='1' then temp<=Ent;
			else temp<=temp;
		end if;
	end  if;
end process;
Q<=temp;
end desarrollo;