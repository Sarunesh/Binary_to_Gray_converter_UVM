class b2g_subscriber extends uvm_subscriber#(b2g_tx);
	// Factory registration
	`uvm_component_utils(b2g_subscriber)

	// Constructor
	`NEW_COMPONENT

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("B2G_SUBSCRIBER","Inside the build_phase of b2g_subscriber",UVM_HIGH)
	endfunction
	
	virtual function void write(b2g_tx t);
	endfunction
endclass
