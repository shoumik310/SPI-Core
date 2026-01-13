// Code your design here
module shift_reg #(parameter w=8)(
  input        clk, 
               reset,
               transfer_en,
	       transfer_idle,
  input        [w-1:0] w_buf_out,
  input  wire MISO,

  output logic MOSI, 
  output logic [w-1:0] r_buf_in  
);

  logic [w-1:0] shift_reg;	

always_comb begin
	MOSI = shift_reg[7];
	r_buf_in = shift_reg;
end

always_ff @(posedge clk) begin
    if(reset) begin
	shift_reg <= 0;
    end
    else if (transfer_en) begin
	shift_reg = shift_reg<<1 + MISO;
    end
    else begin
	shift_reg <= w_buf_out;
    end
	
end



endmodule