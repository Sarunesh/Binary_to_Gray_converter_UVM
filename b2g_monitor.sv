class b2g_monitor extends uvm_monitor;
	// Factory registration
	`uvm_component_utils(b2g_monitor)

	// Analysis port creation
	uvm_analysis_port#(b2g_tx) a_port;

	// Constructor
	`NEW_COMPONENT

	// Virtual interface
	virtual b2g_intf vif;

	// Properties
	int count;
	b2g_tx tx;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		a_port = new("a_port",this);
		`uvm_info("B2G_MONITOR","Inside build_phase of b2g_monitor",UVM_HIGH)
	// Reading interface from config db
		if(!uvm_config_db#(virtual b2g_intf)::get(this,get_full_name(),"VIF",vif))
			`uvm_fatal("B2G_MONITOR","### Failed to read the interface from db")
	endfunction

	//run_phase
	task run_phase(uvm_phase phase);
		@(negedge vif.rst);
		`uvm_info("B2G_DRIVER","Inside the run_phase of b2g_monitor",UVM_HIGH)
		if(!uvm_config_db#(int)::get(null,get_full_name(),"COUNT",count))
			`uvm_fatal("B2G_MONITOR","Failed to read the COUNT value in monitor")
		repeat(count)begin
			#1;
			tx			= new();
			tx.binary	= vif.binary;
			tx.gray		= vif.gray;
			a_port.write(tx);
			//tx.print();
		end
	endtask
endclass
