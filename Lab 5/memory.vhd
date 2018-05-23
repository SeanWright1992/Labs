
--------------------------------------------------------------------------------
--
-- LAB #5 - Memory and Register Bank
--
--------------------------------------------------------------------------------
LIBRARY ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
Use ieee.std_logic_unsigned.all;

entity RAM is
    Port(Reset:	  in std_logic;
	 Clock:	  in std_logic;	 
	 OE:      in std_logic;
	 WE:      in std_logic;
	 Address: in std_logic_vector(29 downto 0);
	 DataIn:  in std_logic_vector(31 downto 0);
	 DataOut: out std_logic_vector(31 downto 0));
end entity RAM;

architecture staticRAM of RAM is

   type ram_type is array (0 to 127) of std_logic_vector(31 downto 0);
   signal i_ram : ram_type;

begin

  RamProc: process(Clock, Reset, OE, WE, Address) is

  begin
    if Reset = '1' then
      for i in 0 to 127 loop   
          i_ram(i) <= X"00000000";
      end loop;
    end if;

    if falling_edge(Clock) then
	-- Add code to write data to RAM
	-- Use to_integer(unsigned(Address)) to index the i_ram array
	if (to_integer(unsigned(Address)) >= 0 and to_integer(unsigned(Address)) <=127) then
			if (WE = '1') then
			i_ram(to_integer(unsigned(Address))) <= DataIn;
			end if;
		else
			DataOut <= (others => 'Z');
		end if;
	
    end if;
	-- Rest of the RAM implementation

	if (to_integer(unsigned(Address)) >= 0 and to_integer(unsigned(Address)) <=127) then
		if OE = '0' then
			DataOut <= i_ram(to_integer(unsigned(Address)));
		else
			DataOut <= (others => 'Z');
		end if;

  end process RamProc;

end staticRAM;	


--------------------------------------------------------------------------------
LIBRARY ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
Use ieee.std_logic_unsigned.all;

entity Registers is
    Port(ReadReg1: in std_logic_vector(4 downto 0); 
         ReadReg2: in std_logic_vector(4 downto 0); 
         WriteReg: in std_logic_vector(4 downto 0);
	 WriteData: in std_logic_vector(31 downto 0);
	 WriteCmd: in std_logic;
	 ReadData1: out std_logic_vector(31 downto 0);
	 ReadData2: out std_logic_vector(31 downto 0));
end entity Registers;

architecture remember of Registers is
	component register32
  	    port(datain: in std_logic_vector(31 downto 0);
		 enout32,enout16,enout8: in std_logic;
		 writein32, writein16, writein8: in std_logic;
		 dataout: out std_logic_vector(31 downto 0));
	end component;
signal result_s0, result_s1, result_s2, result_s3, result_s4, result_s5, result_s6, result_s7, result_0 :std_logic_vector(31 downto 0);
signal write_s0, write_s1, write_s2, write_s3, write_s4, write_s5, write_s6, write_s7, write_zero : std_logic;
	
begin
    -- Add your code here for the Register Bank implementation
process (writeReg, write_s0, write_s1, write_s2, write_s3, write_s4, write_s5, write_s6, write_s7, write_zero, WriteCmd)
	
	

end remember;