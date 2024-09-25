class b2g_tx extends uvm_sequence_item;
	// Properties
	rand bit [CODE_LENGTH-1:0] binary;
		 bit [CODE_LENGTH-1:0] gray;

	// Factory registration
	`uvm_object_utils_begin(b2g_tx)
		`uvm_field_int(binary,UVM_ALL_ON)
		`uvm_field_int(gray,UVM_ALL_ON)
	`uvm_object_utils_end

	// Constructor
	`NEW_OBJECT
endclass
