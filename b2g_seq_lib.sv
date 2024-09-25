class base_sequence extends uvm_sequence#(b2g_tx);
	// Factory registration
	`uvm_object_utils(base_sequence)

	// Constructor
	`NEW_OBJECT
endclass

class binary_generate extends base_sequence;
	// Factory registration
	`uvm_object_utils(binary_generate)

	// Constructor
	`NEW_OBJECT

	task body();
		`uvm_info("BINARY_GENERATE","Inside body task of sequence",UVM_HIGH)
	endtask
endclass
