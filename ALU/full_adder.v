//Verilog implementation of a half-adder (basic gates considered primitives)
//half-adder takes in two bit words of width WIDTH and ouputs the sum and carry
//Of each bitwise.  Used as a component of the full adder.
`include "half_adder.v"

module FA (sum, carry, i1, i2, i3);
//-------input ports-----------
input i1;
input i2;
input i3;

//-------output ports----------
output sum;  //Should not be reg, because it's continuously assigned to
                      //Whatever comes out of half_adder2's sum port
output reg carry;

//-------wires needed----------
wire HA1_cout;
wire HA1_sout;
wire HA2_cout;

//------modules needed---------
HA half_adder1(
    .i1(i1),
    .i2(i2),
    .sum(HA1_sout),
    .carry(HA1_cout)
);
HA half_adder2(
    .i1(HA1_sout),
    .i2(i3),
    .sum(sum),
    .carry(HA2_cout)
);
//Could just do an assign instead of always
//assign carry = a & b;
//assign sum = a ^ b;


always @ (*) //Changes anytime one of it's inputs change
begin
    carry = HA1_cout | HA2_cout; //bitwise OR
end

endmodule

