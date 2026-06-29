`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:57:28 11/23/2016 
// Design Name: 
// Module Name:    lowp2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lowp6(signal_in,
                                signal_out, 
                                clock_in,
                                reset,
										  enable);

input enable;
input   signed  [27:0]  signal_in;
output reg   signed  [27:0]  signal_out;
input   clock_in;
input   reset;          //reset filter on reset high.
integer z;

function integer log2(input integer v); begin log2=0; while(v>>log2) log2=log2+1; end endfunction
parameter N=1024;
parameter N2=log2(N)-1;
reg signed [27+N2:0]  signal_out_tmp;


reg signed[27:0] data [0:N-1];
genvar i;
generate
	 for (i = 0; i < N-1 ; i = i + 1) begin: gd
		 always @(posedge clock_in) begin
		 	if(reset==1'b1)
			begin
				data[i+1]<=0;
			end
			else
			begin
				data[i+1] <= data[i];
			end
		 end
    end
endgenerate
always @(posedge clock_in) begin
	if(reset==1'b1)
	begin
		data[0]<=0;
	end
	else
	begin
    end
endgenerate
always @(posedge clock_in) begin
	if(reset==1'b1)
	begin
		data[0]<=0;
	end
	else
	begin
		data[0] <= signal_in;
	end
end
reg signed [27+N2:0]  signal_out_tmp_3;
wire signed [27+N2:0]  signal_out_tmp_2=signal_out_tmp_3+signal_in-data[N-1];

always@(posedge clock_in) begin
	if(reset == 1'b1) begin
		signal_out <= 0;
		signal_out_tmp_3 <= 0;
	end else begin
		signal_out <= signal_out_tmp_2[27+N2:N2];
		signal_out_tmp_3 <= signal_out_tmp_2;
	end
end

//assign signal_out=signal_out_tmp;


endmodule
