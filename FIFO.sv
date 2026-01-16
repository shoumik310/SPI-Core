module fifo 
	#(	parameter DATA_WIDTH=8, 
		parameter DEPTH=8) (
	input clk,
	input reset,
	
	input [DATA_WIDTH-1:0] data_in,
	input wr_en,
	input rd_en,
	
	output logic [DATA_WIDTH-1:0] data_out,
	output logic full,
	output logic empty
);

logic [DATA_WIDTH-1:0] fifo_data [$clog2(DEPTH)];
logic [$clog2(DEPTH)-1:0] counter;
logic [1:0] rd_ptr;
logic [1:0] wr_ptr;

// localparam [ $clog2(MAX_COUNT)-1 : 0 ] TERMINAL_COUNT = DEPTH - 1;

always_comb begin	
	full = counter == DEPTH;
	empty = counter == 0;
end

// Counter increment logic
always_ff @ (posedge clk) begin
	if(reset) begin
		counter <=0;
	end
	else begin
		case ({wr_en, rd_en})
			2'b01: counter <= counter -1;
			2'b10: counter <= counter +1;
			default: counter <= counter; 
		endcase
	end
end

// Data write into FIFO
always_ff @ (posedge clk) begin
	if (reset) 
		wr_ptr <= 0;
	if(wr_en && !reset) begin
		wr_ptr <= wr_ptr+1;
		fifo_data[wr_ptr] <= data_in;
	end
end

// Data read out of FIFO
always_ff @ (posedge clk) begin
	if (reset) 
		rd_ptr <= 0;
		data_out <= 0;
	if(rd_en && !reset) begin
		data_out <= fifo_data[rd_ptr];
		rd_ptr <= rd_ptr+1;
	end
end


endmodule