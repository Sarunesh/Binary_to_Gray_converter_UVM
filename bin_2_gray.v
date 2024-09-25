module bin_2_gray(rst,binary,gray);
	parameter CODE_LENGTH=3;
	input rst;
	input	  [CODE_LENGTH-1:0] binary;
	output reg[CODE_LENGTH-1:0] gray;

	function reg[CODE_LENGTH-1:0] gray_conv(input reg[CODE_LENGTH-1:0] num);
		gray_conv = num ^ (num >> 1);
	endfunction

	always@* begin
		if(!rst) gray = 0;				// Negative reset
		else gray = gray_conv(binary);
	end
endmodule
