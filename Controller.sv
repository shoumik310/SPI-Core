module controller(
	input spe,
	input clk,
	input reset,
	
	input w_fifo_empty,
	
	output logic w_fifo_en,
	output logic r_fifo_en,
	
	output spif,
	
	output logic spi_transfer_en
);


logic byte_counter_clr;
logic byte_counter_status;

logic block_counter_clr;
logic block_counter_status;
logic block_counter_inc;

counter #(.MAX_COUNT(8)) byte_counter (
	.clk(clk),
	.reset(reset),
	.clr(byte_counter_clr),
	.status(byte_counter_status)
);


counter #(.MAX_COUNT(4)) block_counter (
	.clk(block_counter_inc),
	.reset(reset),
	.clr(block_counter_clr),
	.status(block_counter_status)
);

localparam IDLE = 0;
localparam START = 1;
localparam TRANSFER = 2;
localparam NEXT = 3;

logic [1:0] state;

always_comb spif = block_counter_status;

always @ (*) begin
	
	byte_counter_clr  = 0;
	block_counter_clr = 0;
	w_fifo_en         = 0;
	r_fifo_en         = 0;
	block_counter_inc = 0;
	spi_transfer_en = 0;

	case (state)
		// IDLE: 
		START: begin
			byte_counter_clr = 1;
			block_counter_clr = 1;
			w_fifo_en = 1;
		end
		TRANSFER: 
			spi_transfer_en = 1;
		NEXT: begin
			byte_counter_clr = 1;
			w_fifo_en = 1;
			r_fifo_en = 1;
			block_counter_inc = 1;
		end
		default begin
			byte_counter_clr  = 0;
			block_counter_clr = 0;
			w_fifo_en         = 0;
			r_fifo_en         = 0;
			block_counter_inc = 0;
		end
	endcase
	
end

always_ff @ (posedge clk) begin
	if(reset)
		state <= IDLE;
	else begin
		if (!spe)
			state <= IDLE;
		else begin
			case (state)
				IDLE: state <= w_fifo_empty ? IDLE : START;
				START: state <= TRANSFER;
				TRANSFER: state <= !byte_counter_status ? TRANSFER : NEXT;
				NEXT: state <= w_fifo_empty ? IDLE : TRANSFER;
				default: state <= IDLE;
			endcase
		end	
	end
end


endmodule


module counter(
	input clk,
	input reset,
	input clr,
	
	output logic status
);

parameter MAX_COUNT = 8;

logic [$clog2(MAX_COUNT):0] cnt;

localparam [ $clog2(MAX_COUNT)-1 : 0 ] TERMINAL_COUNT = MAX_COUNT - 1;

always_comb status = (cnt == TERMINAL_COUNT);

always_ff @ (posedge clk) begin
	if(reset || clr)
		cnt <= 0;
	else begin
		if (!status) begin
			cnt <= cnt + 1;
		end
	end
end

endmodule