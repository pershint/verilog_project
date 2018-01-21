//We're doing the first steps found in the "Verilog in one day" section of 
//ASIC's verilog tutorials

//////////////USAGE/////////////////
// The arbiter is a general framework for a module with:
// Clock, reset, input_0, input_1, output_0, output_1
// input_0 high: set req_0 low, req_0 high
// input_1 high; set req_1 low, req_0 high
// reset high; both req bits 0


//hot tips: how do you read: 3'b001
//  3 is the number of bits
//  b means in binary (d,b,o,h all options)
//  001 is the bitword (ordering of bits defined
//  by how the variable is defined

module arbiter (clock,reset,req_0,req_1,
        gnt_0,gnt_1,address);
//-------input ports-----------
input clock,reset,req_0,req_1 ;
output gnt_0,gnt_1;
//[7;0] means 0 is the rightmost bit to begin vector, then move left.  little-endian convention
inout [7:0] address;  //8 bit port reads in and out

if (req_0 == 1'b1) begin
    gnt_0 = 0;
    gnt_1 = 1;
end
if (req_1 == 1'b1) begin
    gnt_0 = 1;
    gnt_1 = 0;
end
if (reset==1'b1) begin
    $display ("Got a reset signal!")
    gnt_0 = 0;
    gnt_0 = 0;
end

case(clock)
    0: $display ("Clock is low right now")
    1: $display ("Clock is high right now")
    default: $display ("Why are you here?  Your clock shoul be 0 or 1...")
endcase

endmodule
