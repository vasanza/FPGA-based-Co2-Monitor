--descripcion vhdl MSS
library ieee;
use ieee.std_logic_1164.all;

--formato start, estudiantesmax, dosseg
entity MSSB is
	port(clk, resetn,start,cend,iend,jend,jmeni,cdend: in std_logic;
				m1,encnt,ld1,reseti,resetj,enj,ldj,eni,ldi,s0,s1,sd0,sd1,entempi,entempj,encmen: out std_logic;
				state: out std_logic_vector(4 downto 0));
end MSSB;

architecture comportamiento of MSSB is
--declaracion de senales
	type estado is (T1, T2, T3, T4, T5, T6,T7,T8,T9,T10,T11,T12,T13,T14,T15,T16,aux); --todos los estados que pertenecen a la MSS
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
					when T3 => if cend='1' then y<=T5;
								  else y<=T4; end if;
									
					when T4 => y<=T3;
					when T5 => y<=T6;
-- carga de datos es hasta aqui 
					when T6 => y<=T7;
					when T7 => y<=aux;
							
					when aux => if jmeni='1' then y<=T8;
								  else y<= T10; end if;
					
					when T8 => y<=T9;
					
					when T9 => y<=T10;
					
					when T10 => if jend='1' then y<=T12;
									else y<= T11; end if;
									
					when T11 => y<=T6;
					when T12 => if cdend  ='1' then y<=T14;
									else y<= T13; end if;
					when T13=> y<=T5;
					when T14=> if cend='1' then y<= T16;
									else y<= T15; end if;
					when T15=> y<= T14;
					when T16=> y<= T1;
									
				end case;
		end if;
	end process;
	process(y) --recepcion de salidas:
	begin
		--Antes que nada se comienza encerando los valores para evitar que venga activada con anterioridad
		m1<='0';encnt<='0';state<="00000";ld1<='0';reseti<='0';resetj<='0';enj<='0';ldj<='0';eni<='0';ldi<='0';s0<='0';s1<='0';sd0<='0';sd1<='0';entempi<='0';entempj<='0';encmen<='0';
		case y is

			when T1 => state<="00001";--no se les asigna valor por lo que o van a realizar ninguna accion en el estado
			when T2 => state<="00010";ld1<='1';encnt<='1';
			when T3 => state<="00011"; 
			when T4 => state<="00100";encnt<='1';
			when T5 => state<="00101";reseti<='1'; resetj<='1';encnt<='1';ld1<='1';
			when T6 => state<="00110";s0<='1'; entempi<='1';
			when T7 => state<="00111";s1<='1'; entempj<='1';
			when aux => state<="11111";
			when T8 => state<="01000";s1<='1';sd0<='1';m1<='1';
			when T9 => state<="01001";s0<='1';sd1<='1';m1<='1';
			when T10 => state<="01010";
			when T11 => state<="01011";eni<='1';
			when T12 => state<="01100";
			when T13 => state<="01101";encmen<='1';
			when T14 => state<="01110";
			when T15 => state<="01111";encnt<='1';
			when T16 => state<="10000";
		
			
			
		end case; --fin del case
	end process; --fin del process
end comportamiento;--Fin del architecture