//writing the 4-bit RCA module
module full_adder(sum, cout, x, y, cin);
  input x, y, cin;
  output sum, cout;
  
  assign sum = x^y^cin;
  assign cout = (x & y)| (y & cin) | (cin & x);

endmodule

module rca_adder_4 (Sum, Cout, X, Y, Cin);
	input [3:0] X, Y;
	input Cin;
	output [3:0] Sum;
	output Cout;
    wire[2:0] c_out;
    
  full_adder b0(Sum[0], c_out[0], X[0], Y[0], Cin);
  full_adder b1(Sum[1], c_out[1], X[1], Y[1], c_out[0]);
  full_adder b2(Sum[2], c_out[2], X[2], Y[2], c_out[1]);
  full_adder b3(Sum[3], Cout, X[3], Y[3], c_out[2]);

endmodule


//testbench
module tb_rca;
    reg [3:0] X, Y;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    parameter STDIN = 32'h8000_0000;
    integer testid;
    integer ret;

    rca_adder_4 DUT (Sum, Cout, X, Y, Cin);
  
  initial begin
    ret = $fscanf(STDIN, "%d", testid);
    case(testid)
        0: begin #10 X=01; Y=12; Cin=0; end
	    1: begin #10 X=10; Y=00; Cin=1; end
	    2: begin #10 X=00; Y=07; Cin=0; end
	    3: begin #10 X=11; Y=12; Cin=1; end
	    4: begin #10 X=15; Y=13; Cin=1; end
	    5: begin #10 X=15; Y=15; Cin=1; end
	    6: begin #10 X=14; Y=03; Cin=0; end
	    7: begin #10 X=02; Y=15; Cin=1; end
      default: begin
	        $display("Bad testcase id %d", testid);
	        $finish();
	    end
    endcase
    #5;
	  if ( (testid == 0 && {Cout,Sum} == 13) || (testid == 1 && {Cout,Sum} == 11) ||
	       (testid == 2 && {Cout,Sum} == 07) || (testid == 3 && {Cout,Sum} == 24) || 	
           (testid == 4 && {Cout,Sum} == 29) || (testid == 5 && {Cout,Sum} == 31) || 	
           (testid == 6 && {Cout,Sum} == 17) || (testid == 7 && {Cout,Sum} == 18) ) 
	    pass();
	  else
	    fail();
  end
  task fail; begin
    $display("Fail: (X = %b, Y = %b, Cin = %b) != (Cout = %b, Sum = %b)", X, Y, Cin, Cout, Sum);
    $finish();
    end
  endtask
  task pass; begin
    $display("Pass: (X = %b, Y = %b, Cin = %b) = (Cout =%b, Sum = %b)", X, Y, Cin, Cout, Sum);
    $finish();
    end
  endtask
endmodule
