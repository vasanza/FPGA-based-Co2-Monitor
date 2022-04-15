library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity RAM2 is
port(clock, WE: in std_logic;
		Data: in std_logic_vector(7 downto 0);
		Address: in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(7 downto 0));
end RAM2;

architecture comp of RAM2 is
type ram_type is array (254 downto 0) of std_logic_vector (7 downto 0);
-- type ram_type is array *número de palabras* of std_logic_vector *longitud de la palabras*;
signal memram: ram_type;
begin
---DATOSSSSSSS
process(clock)
begin
	if (clock'event and clock='1') then
		if WE='1' then
			memram(conv_integer(address)) <= Data;
		else
			Q <= memram(conv_integer(address));
		end if;
	end if;
end process;
end comp;