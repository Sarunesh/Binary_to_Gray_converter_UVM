class b2g_subscriber extends uvm_subscriber#(b2g_tx);
	// Factory registration
	`uvm_component_utils(b2g_subscriber)

	// Properties
	b2g_tx tx;

	// Coverage
	covergroup binary_cg;
		type_option.goal = 2**CODE_LENGTH;

		BINARY:coverpoint tx.binary{
			//option.auto_bin_max = CODE_LENGTH;
		}
		GRAY:coverpoint tx.gray{
			//option.auto_bin_max = CODE_LENGTH;
		}
	endgroup

	// Constructor
	function new(string name="",uvm_component parent=null);
		super.new(name,parent);
		binary_cg=new();
	endfunction

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("B2G_SUBSCRIBER","Inside the build_phase of b2g_subscriber",UVM_HIGH)
	endfunction
	
	virtual function void write(b2g_tx t);
		$cast(tx,t);
		binary_cg.sample();
	endfunction
endclass
