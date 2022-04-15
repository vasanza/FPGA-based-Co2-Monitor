--descripcion vhdl MSS
library ieee;
use ieee.std_logic_1164.all;

--formato start, estudiantesmax, dosseg
entity MSSQ is
	port(clk, resetn,start,jmenp,jend: in std_logic;
				enpivot,s0,s1,sd0,sd1,m1,entempi,entempj,eni,enj,resetj,reseti: out std_logic;
				state: out std_logic_vector(4 downto 0));
end MSSQ;

architecture comportamiento of MSSQ is
--declaracion de senales
	type estado is (T1, T2, T3, T4, T5, T6,T7,T8,T9,T10,T11,T12,T13,T14,T15,T16,T17); --todos los estados que pertenecen a la MSS
	signal y : estado; -- definimos nuestra variable de estado
 
begin
	process(clk,resetn)
	begin
		if resetn='0' then y<=T1;
		elsif (clk'event and clk='1') then
				case y is 
					when T1 => if start='1' then y<=T2; 
									else y<=T1; end if; 
					when T2 => y<=T3; 
									
					when T3 => y<=T4;
									
					when T4 => y<=T5;
					when T5 => y<=T6;
-- carga de datos es hasta aqui 
					when T6 => y<=T7;
					when T7 => if jmenp = '1' then y<=T8;
					else y<= T12; end if;
					
					when T8 => y<=T9;
					when T9 => y<=T10;
					when T10 => y<=T11;
					when T11 => y<=T12;
					
					when T12 => if jend = '1' then y<= T14;
					else y<= T13; end if;
					
					when T13 => y<= T6;
					
					when T14 => y<=T15;
					
				   when T15 => if jend ='1' then y<=t17;
					else y<=T16; end if;
					
					when T16 => y<=T15;
					when T17 => y<=T1;
					
					
									
				end case;
		end if;
	end process;
	process(y) --recepcion de salidas:
	begin
		--Antes que nada se comienza encerando los valores para evitar que venga activada con anterioridad
		state<="00000";enpivot<='0';s0<='0';s1<='0';sd0<='0';sd1<='0';m1<='0';entempi<='0';entempj<='0';eni<='0';enj<='0';reseti<='0'; resetj<='0'; 
		case y is

			when T1 => state<="00001"; reseti<='1'; resetj<='1';
			when T2 => state<="00010";S0<='1';S1<='1'; enpivot<='1';
			when T3 => state<="00011";entempi<='1';
			when T4 => state<="00100";sd0<='1';Sd1<='1';m1<='1';
			when T5 => state<="00101";sd0<='1';S0<='1';m1<='1';S1<='1';
			when T6 => state<="00110";s1<='1'; entempj<='1';
			when T7 => state<="00111";
			when T8 => state<="01000";eni<='1';
			when T9 => state<="01001";s0<='1';entempi<='1';
			when T10 => state<="01010";s0<='1';Sd1<='1';m1<='1';
			when T11 => state<="01011";s1<='1';Sd0<='1';m1<='1';
			when T12 => state<="01100";
			when T13 => state<="01101";enj<='1';
			when T14 => state<="01110";resetj<='1';
			
			when T15 => state<="01111";s1<='1';
			when T16 => state<="10000";enj<='1';s1<='1';
			when T17 => state<="10001";s1<='1';
		
			
			
		end case; --fin del case
	end process; --fin del process
end comportamiento;--Fin del architecture