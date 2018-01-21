//We're doing the first steps found in the "Verilog in one day" section of 
//ASIC's verilog tutorials

//////////////USAGE/////////////////
// The arbiter is a general framework for a module with:
// Clock, reset, input_0, input_1, output_0, output_1

module arbiter (
    clock   ,
    reset   ,
    req_0   , //Request 0
    req_1   , //Request 1
    gnt_0   , //Grant 0
    gnt_1   , //Grant 1
    address ,
);
//-------input ports-----------
input       clock       ;
input       reset       ;
input       req_0       ;
input       req_1       ;
//------output ports----------
output      gnt_0       ;
output      gnt_1       ;
//[7;0] means 0 is the rightmost bit to begin vector, then move left.  little-endian convention
inout [7:0] address;  //8 bit port reads in and out


