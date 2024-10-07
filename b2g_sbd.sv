class b2g_sbd extends uvm_scoreboard;
	// Factory registration
	`uvm_component_utils(b2g_sbd)

	// Analysis imp creation
	uvm_analysis_imp#(b2g_tx,b2g_sbd) a_imp;

	// Constructor
	`NEW_COMPONENT

	// Properties
	b2g_tx tx, tx_t;
	int count, sbd_start;
	int temp=CODE_LENGTH-2;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		a_imp = new("a_imp",this);
		`uvm_info("B2G_SBD","Inside build_phase of b2g_sbd",UVM_HIGH)
	endfunction

	// run_phase
	task run_phase(uvm_phase phase);
		#2;
		`uvm_info("B2G_SBD","Inside run_phase of b2g_sbd",UVM_HIGH)
		if(!uvm_config_db#(int)::get(this,get_full_name(),"COUNT",count))
			`uvm_fatal("B2G_SBD","Failed to read the count value in scoreboard")
		repeat(count)begin
			wait(sbd_start);
	// Reference model
			tx_t=new();
			tx_t.binary=tx.binary;
			tx_t.gray=tx_t.binary^(tx_t.binary>>1);
			//tx_t.gray[CODE_LENGTH-1]=tx_t.binary[CODE_LENGTH-1];
			//while(temp>=0)begin
			//	tx_t.gray[temp] = tx_t.binary[temp+1]^tx_t.binary[temp];
			//	temp--;
			//end

	// Checker logic
			if(tx.gray == tx_t.gray) b2g_common::gray_match++;
			else b2g_common::gray_mismatch++;

			sbd_start=0;
		end
	endtask

	virtual function void write(b2g_tx t);
		$cast(tx,t);
		sbd_start=1;
	endfunction
endclass
