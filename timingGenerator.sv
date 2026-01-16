module timingGenerator (
    input clk, 
    input reset,
    input en, 
    input clr,
    input [3:0] spr,
    input cpol,
    // input cpha,// TODO: Implement CPHA functionality
    output logic clk_out,
    output logic clk_op_out
);

    logic clk_div;
    logic [11:0] counter;
    logic buffer;
    logic phase_shift_buffer;

    always_comb begin
        clk_out = buffer ^ cpol;
        clk_op_out = phase_shift_buffer;
    end

    always @ * begin    
        case (spr)
            4'b0000: clk_div = counter[0];
            4'b0001: clk_div = counter[1];
            4'b0010: clk_div = counter[3];
            4'b0011: clk_div = counter[4];
            4'b0100: clk_div = counter[2];
            4'b0101: clk_div = counter[5];
            4'b0110: clk_div = counter[6];
            4'b0111: clk_div = counter[7];
            4'b1000: clk_div = counter[8];
            4'b1001: clk_div = counter[9];
            4'b1010: clk_div = counter[10];
            4'b1011: clk_div = counter[11];
            default: clk_div = counter[0];
        endcase    
    end

    always_ff @ (posedge clk) begin
        if (reset || clr) begin
            counter <= 0; 
            buffer <= 0;
        end
        else if (en) begin
            counter <= counter + 1; 
            buffer <= clk_div;
        end
    end

    always_ff @ (negedge clk) begin
        phase_shift_buffer <= clk_out;
    end
endmodule