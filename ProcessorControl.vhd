library ieee;
use ieee.std_logic_1164.all;

entity ProcessorControl is
port(
	opcode: in std_logic_vector(5 downto 0);
	clk : in std_logic;
	RegDst,Jump,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite : out std_logic; --Logic
	ALUOp : out std_logic_vector(1 downto 0) --Send to ALUControl
	);
end;

architecture rtl of ProcessorControl is
-- 35 Load, 43 Store, 4 Branch, 2 Jump, 0 Rtype

signal int_ALUOp : std_logic_vector(1 downto 0);
signal dec35,dec43,dec0,dec4,dec2 : std_logic;
begin
	
	dec35 <= opcode(5) and opcode(1) and opcode(0) and not(opcode(4) or opcode(3) or opcode(2)); --Load Word
	dec43 <= opcode(5) and opcode(3) and opcode(1) and opcode(0) and not(opcode(4) or opcode(2)); --Store Word
	dec0 <= not(opcode(0) or opcode(1) or opcode(2) or opcode(3) or opcode(4) or opcode(5)); --R type
	dec4 <= not(opcode(0) or opcode(1) or opcode(3) or opcode(4) or opcode(5)) and opcode(2); --Branch
	dec2 <= not(opcode(0) or opcode(2) or opcode(3) or opcode(4) or opcode(5)) and opcode(1); -- Jump
	
	
	Branch <= dec4;
	Jump <= dec2;
	RegDst <= dec0;
	ALUSrc <= dec35 or dec43 or dec4 or dec2;
	MemToReg <= dec35;
	MemRead <= dec35;
	MemWrite <= dec43;
	RegWrite <= dec35 or dec0;
	ALUOp(0) <= dec4;
	ALUOp(1) <= dec0;

end;
	