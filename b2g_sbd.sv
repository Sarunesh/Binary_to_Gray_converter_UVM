class b2g_sbd extends uvm_scoreboard;
	// Factory registration
	`uvm_component_utils(b2g_sbd)

	// Constructor
	`NEW_COMPONENT

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("B2G_SBD","Inside build_phase of b2g_sbd",UVM_HIGH)
	endfunction
endclass
