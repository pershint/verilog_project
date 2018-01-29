//Here's a couple ways you could implement the AND gate

module and_gate #(parameter WIDTH-1)(out, a, b);
//-------input ports-----------
input [WIDTH-1:0]a,
input [WIDTH-1:0]b;

//-------output ports----------
output [WIDTH-1:0]out;

assign out = a & b;

//Apparently, using reg (misomer for variable) also works, and is 
//compatible with both combinatorial and sequential logic
//reg is necessary if this is going to be used in sequential logic eventually
//Comment the assign line and uncomment the below for usage
//NOTE: reg or wire are only meaningful for outputs apparently
//NOTE 2; could remove lower line or replace output out with output reg out;
//reg out;

//always @ (a or b);
//begin
//  out = a & b;
//end

endmodule

