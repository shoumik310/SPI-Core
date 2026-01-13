module #(parameter DATA_WIDTH(8))fifo(
	input clk,
	input reset,
	
	input [DATA_WIDTH-1:0] data_in
	input wr_en,
	input rd_en,
	
	output [DATA_WIDTH-1:0] logic data_out,
	output logic full,
	output logic empty
);

logic [DATA_WIDTH-1:0] fifo_data [3:0];
logic [1:0] rd_ptr;
logic [1:0] wr_ptr;

always_comb begin
	data_out = fifo_data[rd_ptr];		
	
	full = rd_ptr<wr_ptr
end


always_ff @ (posedge clk) begin
	if(reset)
		wr_ptr <= 0;
	else if(wr_en)
		wr_ptr <= wr_ptr+1;
		fifo_data[wr_ptr] <= data_in;
	else
		wr_ptr <= wr_ptr;
end


always_ff @ (posedge clk) begin
	if(reset)
		rd_ptr <= 0;
	else if(rd_en)
		rd_ptr <= rd_ptr+1;
	else
		rd_ptr <= rd_ptr;
end


endmodule