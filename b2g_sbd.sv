class b2g_sbd extends uvm_scoreboard;
	// Factory registration
	`uvm_component_utils(b2g_sbd)

	// Analysis imp creation
	uvm_analysis_imp#(b2g_tx,b2g_sbd) a_imp;

	// Constructor
	`NEW_COMPONENT

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		a_imp = new("a_imp",this);
		`uvm_info("B2G_SBD","Inside build_phase of b2g_sbd",UVM_HIGH)
	endfunction

	virtual function void write(b2g_tx t);
	endfunction
endclass
