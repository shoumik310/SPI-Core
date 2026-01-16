module SPI_CORE
    #(parameter DATA_WIDTH=8)(
    input clk,
    input reset,

    input [8:0] control,

    input [DATA_WIDTH-1:0] data_in,
    output logic [DATA_WIDTH-1:0] data_out,

    output logic sck,
    output logic mosi,
    input        miso,

    output logic spif
);

    wire spe = control[0];
    wire spr = control[4:1];
    wire cpol = control[5];
    wire cpha = control[6]; //TODO: Implement CPHA functionality
    wire w_fifo_wen = control[7];
    wire r_fifo_ren = control[8];
    
    logic int_clk_clr;
    logic int_clk_en;

    logic i_clk_ps; //phase shifted clk

    logic w_fifo_ren;
    logic r_fifo_wen;
    logic spi_transfer_en;

    logic w_fifo_full;
    logic r_fifo_full;
    logic w_fifo_empty;
    logic r_fifo_empty;
    logic w_fifo_data_out;
    logic r_fifo_data_in;

    timingGenerator Clk_Gen (
     .clk (clk),
     .reset (reset),
     .en (spe),
     .clr (int_clk_clr),
     .spr (spr),
     .cpol (cpol),
     .clk_out (sck),
     .clk_op_out (i_clk_ps)
    );

    controller Controller_Inst (
        .spe (spe),
        .clk (i_clk_ps),
        .reset (reset),
        .w_fifo_empty (w_fifo_empty),
        .w_fifo_en (w_fifo_en),
        .r_fifo_en (r_fifo_en),
        .spif (spif),
        .spi_transfer_en (spi_transfer_en)
    );

    fifo #(.DATA_WIDTH(DATA_WIDTH), .DEPTH(4)) w_fifo (
        .clk (i_clk_ps),
        .reset (reset),
        .data_in (data_in),
        .wr_en (w_fifo_wen),
        .rd_en (w_fifo_ren),
        .data_out (w_fifo_data_out),
        .full (w_fifo_full),
        .empty (w_fifo_empty)
    );

    fifo #(.DATA_WIDTH(DATA_WIDTH), .DEPTH(4)) r_fifo (
        .clk (i_clk_ps),
        .reset (reset),
        .data_in (r_fifo_data_in),
        .wr_en (r_fifo_wen),
        .rd_en (r_fifo_ren),
        .data_out (data_out),
        .full (r_fifo_full),
        .empty (r_fifo_empty)
    );

    shift_reg #(.w(DATA_WIDTH)) shift_reg_inst (
        .clk (i_clk_ps),
        .reset (reset),
        .transfer_en (spi_transfer_en),
        .w_buf_out (w_fifo_data_out),
        .MISO (miso),
        .MOSI (mosi),
        .r_buf_in (r_fifo_data_in)
    );

endmodule