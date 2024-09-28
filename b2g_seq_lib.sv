class base_sequence extends uvm_sequence#(b2g_tx);
	// Factory registration
	`uvm_object_utils(base_sequence)

	// Constructor
	`NEW_OBJECT

	// Properties
	int count;
endclass

class binary_generate extends base_sequence;
	// Factory registration
	`uvm_object_utils(binary_generate)

	// Constructor
	`NEW_OBJECT

	task body();
		`uvm_info("BINARY_GENERATE","Inside body task of sequence",UVM_HIGH)
		if(!uvm_config_db#(int)::get(null,get_full_name(),"COUNT",count))
			`uvm_fatal("BINARY_GENERATE","Failed to read the COUNT value in seq_lib")
		`uvm_info("BINARY_GENERATE",$sformatf("Count=%0d",count),UVM_HIGH)
		repeat(count) begin
			`uvm_do(req)
		end
	endtask
endclass
