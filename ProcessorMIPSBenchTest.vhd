library ieee;
use ieee.std_logic_1164.all;

entity ProcessorMIPSBenchTest is
port(
	ValueSelect : in std_logic_vector(2 downto 0);
	GClock, GResetBar : in std_logic;
	inNum4 : in std_logic_vector(31 downto 0);
	MuxOut : out std_logic_vector(7 downto 0);
	InstructionOut : out std_logic_vector(31 downto 0);
	BranchOut,ZeroOut,MemWriteOut,RegWriteOut,JumpO : out std_logic;
	PCOut,PCin,PC4AddedO,BranchAddressO,JumpAddressO,BranchOffsetO,BranchMuxO : out std_logic_vector(31 downto 0);
	ReadReg1O,ReadReg2O,WriteRegO : out std_logic_vector(4 downto 0)
	);
end;

architecture rtl of ProcessorMIPSBenchTest is

signal instruction,PC,PC4Added,BranchAddress,JumpAddress,BranchOffset,BranchMux: std_logic_vector(31 downto 0) := (others => '0');

signal newPC : std_logic_vector(31 downto 0) := (others => '0');
	
signal ReadReg1,ReadReg2,WriteReg  : std_logic_vector(4 downto 0) := (others => '0');

signal ALUControlSig : std_logic_vector(3 downto 0) := (others => '0');

signal Read1Data,Read2Data, ALUResult,WriteData,MemData,ALUBin, FinalData,int_OutMux: std_logic_vector(7 downto 0):= (others => '0');

signal ALUOp : std_logic_vector(1 downto 0):= (others => '0');

signal zero,RegDst,Jump,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite,int_CoutBranch,PCADDCout : std_logic := ('0');

component RAM1Port is
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;

component ROM1Port is
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component;

component JumpShiftCombPC is
port(
	Jump : in std_logic_vector(25 downto 0);
	PC : in std_logic_vector(3 downto 0);
	O : out std_logic_vector(31 downto 0)
);
end component;

component ALU is
port(
	i_a,i_b : in std_logic_vector(7 downto 0);
	i_ControlSig : in std_logic_vector(3 downto 0); -- 1bit 1 = AU, 1bit 0 = LU
	o_zero : out std_logic;
	o_ALUResult : out std_logic_vector(7 downto 0)
	);
end component;

component ALUControl is
port(
	ALUOp : in std_logic_vector(1 downto 0);
	funct : in std_logic_vector(5 downto 0);
	ALUControl : out std_logic_vector(3 downto 0)
	);
end component;

component mux2to1bit32 is
port(
	A,B : in std_logic_vector(31 downto 0);
	sel : in std_logic;
	O : out std_logic_vector(31 downto 0)
	);
end component;

component mux2to1 is
port(
	A,B : in std_logic_vector(7 downto 0);
	sel : in std_logic;
	O : out std_logic_vector(7 downto 0)
	);
end component;

component mux2to1bit5 is
port(
	A,B : in std_logic_vector(4 downto 0);
	sel : in std_logic;
	O : out std_logic_vector(4 downto 0)
	);
end component;

component mux8to1 is
port(
	i_sel : in std_logic_vector(2 downto 0);
	i_0in,i_1in,i_2in,i_3in,i_4in,i_5in,i_6in,i_7in : in std_logic_vector(7 downto 0);
	o_out : out std_logic_vector(7 downto 0)
	);
end component;


component ProcessorControl is
port(
	opcode: in std_logic_vector(5 downto 0);
	clk : std_logic;
	RegDst,Jump,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite : out std_logic; --Logic
	ALUOp : out std_logic_vector(1 downto 0) --Send to ALUControl
	);
end component;

component registerFile is
	port(
		clk, RegWrite, i_resetBar : in std_logic;
		i_readReg1, i_readReg2, i_writeReg : in std_logic_vector(2 downto 0);
		i_writeData : in std_logic_vector(7 downto 0);
		o_readData1, o_readData2 : out std_logic_vector(7 downto 0)
		);
end component;

component register32bit is
	port(
		i_d : in std_logic_vector(31 downto 0);
		i_clk, i_en, i_resetBar : in std_logic;
		o_q : out std_logic_vector(31 downto 0)
		);
end component;

component register8bit is
	port(
		i_d : in std_logic_vector(7 downto 0);
		i_clk, i_en, i_resetBar : in std_logic;
		o_q : out std_logic_vector(7 downto 0)
		);
end component;

component extend32leftshift2 is
port(
	i_in : in std_logic_vector(15 downto 0);
	o_out : out std_logic_vector(31 downto 0)
	);
end component;

component fullAdder32bit is
port(
	A,B : in std_logic_vector(31 downto 0);
	C : in std_logic;
	S : out std_logic_vector(31 downto 0);
	Cout : out std_logic
	);
end component;

component combineData is
port(
	RegDst,Jump,MemRead,MemToReg,ALUSrc : in std_logic;
	ALUOp : in std_logic_vector(1 downto 0);
	O : out std_logic_vector(7 downto 0)
	);
end component;

begin

-- Instruction Memory/PC
 PCReg : register8bit
 port map(newPC(7 downto 0),GClock,GClock,GResetBar,PC(7 downto 0));
 
 InstructMem : ROM1Port
 port map(PC(7 downto 0),GClock,instruction);
 
 PCNorm : fullAdder32bit
 port map(PC,inNum4,'0',PC4Added,PCADDCout);
 
 JumpBlock : JumpShiftCombPC
 port map(instruction(25 downto 0),PC4Added(31 downto 28),JumpAddress);

--Register File
 muxWriteReg : mux2to1bit5
 port map(instruction(20 downto 16),instruction(15 downto 11),RegDst,WriteReg);
 
 RegFile : RegisterFile
 port map(GClock,RegWrite,GResetBar,instruction(23 downto 21),instruction(18 downto 16),WriteReg(2 downto 0),WriteData,Read1Data,Read2Data);
 
 muxALUB : mux2to1
 port map(Read2Data,instruction(7 downto 0),ALUSrc,ALUBin);
 
 --ALU
 ALUCom : ALU
 port map(Read1Data,ALUBin,ALUControlSig,zero,ALUResult);
 
 ALUCon : ALUControl
 port map(ALUOp,instruction(5 downto 0),ALUControlSig);
 
 --Processor Control
 ProcessorCntrl : ProcessorControl
 port map(instruction(31 downto 26),GClock,RegDst,Jump,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite,ALUop);
 
 --Memory Unit
 RAM : RAM1Port
 port map(ALUResult,GClock,Read2Data,MemWrite,MemData);
 
 muxMem : mux2to1
 port map(ALUResult,MemData,MemToReg,WriteData);
 
 --Branch/Jump to PC
 
 extenderAddr : extend32leftshift2
 port map(instruction(15 downto 0),BranchOffset);
 
 BranchCalc : fullAdder32bit
 port map(PC4Added,BranchOffset,'0',BranchAddress,int_CoutBranch);
 
 BranchMulti : mux2to1bit32
 port map(PC4Added,BranchAddress,(Branch and zero),BranchMux);
 
 JumpMux : mux2to1bit32
 port map(BranchMux,JumpAddress,Jump,newPC);
 
 --Top Level
 
 OutMix : combineData
 port map(RegDst,Jump,MemRead,MemToReg,ALUSrc,ALUOp,FinalData);
 
 OutputMux : mux8to1
 port map(ValueSelect,PC(7 downto 0),ALUResult,Read1Data,Read2Data,WriteData,FinalData,FinalData,FinalData,int_OutMux);
 
 --Output Drivers
 
 MuxOut <= int_OutMux;
 InstructionOut <= instruction;
 BranchOut <= Branch;
 ZeroOut <= zero;
 MemWriteOut <= MemWrite;
 RegWriteOut <= RegWrite;
 PCOut <= PC;
 PCin <= newPC;
 PC4AddedO <= PC4Added;
 BranchAddressO <= BranchAddress;
 JumpAddressO <= JumpAddress;
 BranchOffsetO <= BranchOffset;
 BranchMuxO <= BranchMux;
 JumpO <= Jump;
 
 
end rtl;

