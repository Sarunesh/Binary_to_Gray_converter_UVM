class b2g_driver extends uvm_driver#(b2g_tx);
	// Factory registration
	`uvm_component_utils(b2g_driver)

	// Constructor
	`NEW_COMPONENT

	// Virtual interface
	virtual b2g_intf vif;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("B2G_DRIVER","Inside build_phase of b2g_driver",UVM_HIGH)
		if(!uvm_config_db#(virtual b2g_intf)::get(this,get_full_name(),"VIF",vif))
			`uvm_fatal("B2G_DRIVER","### Failed to read the interface from db")
	endfunction

	//run_phase
	task run_phase(uvm_phase phase);
		`uvm_info("B2G_DRIVER","Inside the run_phase of b2g_driver",UVM_HIGH)
	endtask
endclass
