//Verilog implementation of an n-bit adder.  Overflow is ignored
//.
//half_adder.v already included in full_adder
`include "full_adder.v"

module nbit_adder #(parameter WIDTH=1)(out, i1, i2);
//-------input ports-----------
input [WIDTH-1:0]i1;
input [WIDTH-1:0]i2;

//-------output ports----------
output [WIDTH-1:0]out;  //Not a reg, since it's just tied to outputs of modules  


//-------wires needed----------
wire [WIDTH-1:0]carry;
//wire carry_out;  //Has the overflow bit
output reg carry_out; //Defined as reg since it's in the always loop

//Now, we will use the generate framework to make our needed ladder of full-adders
genvar i;
generate    //generate is used to create a new instance of each module per loop
for(i=0;i<WIDTH;i=i+1)
    begin: generate_nbit_adder   //begin: gen_loop_label
    if (i==0) //Use half-adder for first bit
        HA half_adder(.sum(out[0]),
            .carry(carry[0]),
            .i1(i1[0]),
            .i2(i2[0])
        );
    else
        FA full_adder(.sum(out[i]),
            .carry(carry[i]),
            .i1(i1[i]),
            .i2(i2[i]),
            .i3(carry[i-1])
        );
    //assign carry_out = carry[WIDTH-1];
    end

//Could comment out this always and just use the assign above
always @(*)
begin
    carry_out = carry[WIDTH-1];
end

endgenerate
endmodule

