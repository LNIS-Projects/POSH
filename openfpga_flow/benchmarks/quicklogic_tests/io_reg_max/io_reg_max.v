module io_reg_max (mux_in, demux_out,mux_sel, demux_sel,clk,com_sel);
input [0:1023] mux_in;
input [9:0]mux_sel; 
input [2:0] com_sel;
input [9:0]demux_sel;
input clk;
output [999:0]demux_out;

wire [1023:0]demux_out_w;
wire [9:0]mux_com_sel;

assign mux_com_sel = mux_sel ^ com_sel;

mux_1024x1 mux0 (.in(mux_in),.sel(mux_com_sel),.out(mux_out),.clk(clk));
demux_1x1024 demux0 (.in(mux_out),.sel(demux_sel),.out(demux_out_w),.clk(clk));
assign demux_out = demux_out_w[999:0] ^ demux_out_w[1023:1000] ;

endmodule 
