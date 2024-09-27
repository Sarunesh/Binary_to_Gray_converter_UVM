class b2g_agent extends uvm_agent;
	// Factory registration
	`uvm_component_utils(b2g_agent)

	// Constructor
	`NEW_COMPONENT

	// Properties
	b2g_sequencer sqr;
	b2g_driver drv;
	b2g_monitor mon;
	b2g_subscriber sub;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sqr = b2g_sequencer::type_id::create("sqr",this);
		drv = b2g_driver::type_id::create("drv",this);
		mon = b2g_monitor::type_id::create("mon",this);
		sub = b2g_subscriber::type_id::create("sub",this);
		`uvm_info("B2G_AGENT","Inside build_phase of b2g_agent",UVM_HIGH)
	endfunction

	// connect_phase
	function void connect_phase(uvm_phase phase);
	// Connecting sequencer and driver
		drv.seq_item_port.connect(sqr.seq_item_export);
	// Connecting monitor and subscriber
		mon.a_port.connect(sub.analysis_export);
		`uvm_info("B2G_AGENT","Inside connect_phase of b2g_agent",UVM_HIGH)
	endfunction
endclass
