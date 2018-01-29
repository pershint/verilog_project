//Test bench description to use full adder
//NOTE: Delays only affect the module you put them in. Everything else
//Keeps chugging.  Watch dem race conditions

`include "nbit_adder.v"


module full_adder_testbench;

    parameter BITS=32;
    reg [BITS-1:0]r_word1 = 0;
    reg [BITS-1:0]r_word2 = 0;
    
    wire [BITS-1:0]result;

    nbit_adder #(.WIDTH(BITS))UUT_nbit_adder(
        .out(result),
        .i1(r_word1),
        .i2(r_word2)
    );

    initial //Similar to an always block, but only runs once
        begin
            $dumpfile("nbit_adder.vcd");  //Want to give out a value changed dumped file for debuggin
            $dumpvars(0,UUT_nbit_adder); //Need to give the variables used as well
            r_word1=138;  //Default will be to read as a decimal number
            r_word2=299;
            #10;  //Specifies a delay; wait 10 units of time.
            r_word1=072;
            r_word2=029;
            #10;
            $finish;
        end
endmodule

