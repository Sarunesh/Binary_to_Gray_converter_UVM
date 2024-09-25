class b2g_env extends uvm_env;
	// Factory registration
	`uvm_component_utils(b2g_env)

	// Constructor
	`NEW_COMPONENT

	// Properties
	b2g_agent agent;
	b2g_sbd sbd;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent	= b2g_agent::type_id::create("agent",this);
		sbd		= b2g_sbd::type_id::create("sbd",this);
		`uvm_info("B2G_ENV","Inside build_phase of b2g_env",UVM_HIGH)
	endfunction

	// connect_phase

endclass
