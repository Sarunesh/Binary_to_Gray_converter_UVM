`define NEW_OBJECT \
	function new(string name=""); \
		super.new(name); \
	endfunction

`define NEW_COMPONENT \
	function new(string name="", uvm_component parent=null); \
		super.new(name, parent); \
	endfunction

parameter CODE_LENGTH=3;

class b2g_common;
	static int gray_match;
	static int gray_mismatch;
endclass
