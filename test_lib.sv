class base_test extends uvm_test;
	// Factory registration
	`uvm_component_utils(base_test)

	// Constructor
	`NEW_COMPONENT

	// Properties
	b2g_env env;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env=b2g_env::type_id::create("env",this);
	endfunction

	// end_of_elaboration_phase
	function void end_of_elaboration_phase(uvm_phase phase);
		`uvm_info("BASE_TEST","Inside end_of_elaboration_phase of base_test",UVM_HIGH)
		uvm_top.print_topology();
	endfunction

	// report_phase
endclass

class test_10 extends base_test;
	// Factory registration
	`uvm_component_utils(test_10)

	// Constructor
	`NEW_COMPONENT

	// run_phase
	task run_phase(uvm_phase phase);
		`uvm_info("TEST_10","Inside the run_phase of test_10",UVM_HIGH)
	endtask
endclass
