//Test bench description to use half adder
//NOTE: Delays only affect the module you put them in. Everything else
//Keeps chugging.  Watch dem race conditions

`include "half_adder.v"


module half_adder_testbench;

    reg r_bit1 = 0;
    reg r_bit2 = 0;

    wire w_sum;
    wire w_carry;

    HA half_adder_instance(
        .i1(r_bit1),
        .i2(r_bit2),
        .sum(w_sum),
        .carry(w_carry)
    );

    initial //Similar to an always block, but only runs once
        begin
            $dumpfile("half_adder.vcd");  //Want to give out a value changed dumped file for debuggin
            $dumpvars(0,half_adder_testbench); //Need to give the variables used as well
            r_bit1=1'b0;
            r_bit2=1'b0;
            #10;  //Specifies a delay; wait 10 units of time.
            r_bit1=1'b1;
            r_bit2=1'b0;
            #10;
            r_bit1=1'b0;
            r_bit2=1'b1;
            #10;
            r_bit1=1'b1;
            r_bit2=1'b1;
            #10;
            $finish;
        end
endmodule

