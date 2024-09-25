module top;
	reg rst;

	// Interface instantiation(Physical)
	b2g_intf pif(.rst(rst));

	// Design instantiation
	bin_2_gray#(.CODE_LENGTH(CODE_LENGTH)) dut(
												.rst	(pif.rst),
												.binary	(pif.binary),
												.gray	(pif.gray)
												);

	// Config db
	initial uvm_config_db#(virtual b2g_intf)::set(null,"*","VIF",pif);

	// Methods
	initial begin
		rst=1;
		#5;
		rst=0;
	end

	initial begin
		run_test("base_test");
	end
endmodule
