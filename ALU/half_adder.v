//Verilog implementation of a half-adder (basic gates considered primitives)
//half-adder takes in two bit words of width WIDTH and ouputs the sum and carry
//Of each bitwise.  Used as a component of the full adder.

module HA (sum, carry, i1, i2);
//-------input ports-----------
input i1;
input i2;

//-------output ports----------
output sum;
output carry;

//Could just do an assign instead of always
//assign carry = a & b;
//assign sum = a ^ b;

reg sum,carry;

always @ (i1 or i2)
begin
    carry = i1 & i2; //bitwise AND
    sum = i1 ^ i2;  //bitwise XOR
end

endmodule

