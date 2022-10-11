//Write the module here
module full_adder(sum, cout, x, y, cin);
  input x, y, cin;
  output sum, cout;
  
  assign sum = x^y^cin;
  assign cout = (x & y)| (y & cin) | (cin & x);

endmodule
//testbench
module tb_fa;
    reg x, y, cin;
    wire sum, cout;

    parameter STDIN = 32'h8000_0000;
    integer testid;
    integer ret;

    full_adder DUT (sum, cout, x, y, cin);
  
  initial begin
    ret = $fscanf(STDIN, "%d", testid);
    case(testid)
      0: begin #10 x=0; y=1; cin=0; end
	    1: begin #10 x=1; y=0; cin=1; end
	    2: begin #10 x=1; y=1; cin=1; end
	    3: begin #10 x=1; y=1; cin=0; end
	    4: begin #10 x=0; y=0; cin=1; end
	    5: begin #10 x=1; y=0; cin=1; end
	    6: begin #10 x=0; y=0; cin=0; end
	    7: begin #10 x=0; y=1; cin=1; end
      default: begin
	        $display("Bad testcase id %d", testid);
	        $finish();
	    end
    endcase
    #5;
	  if ( (testid == 0 && {cout,sum} == 2'b01) || (testid == 1 && {cout,sum} == 2'b10) ||
	       (testid == 2 && {cout,sum} == 2'b11) || (testid == 3 && {cout,sum} == 2'b10) || 	
         (testid == 4 && {cout,sum} == 2'b01) || (testid == 5 && {cout,sum} == 2'b10) || 	
         (testid == 6 && {cout,sum} == 2'b00) || (testid == 7 && {cout,sum} == 2'b10) ) 
	    pass();
	  else
	    fail();
  end
  task fail; begin
    $display("Fail: (x = %b, y = %b, cin = %b) != (cout = %b, sum = %b)", x, y, cin, cout, sum);
    $finish();
    end
  endtask
  task pass; begin
    $display("Pass: (x = %b, y = %b, cin = %b) = (cout =%b, sum = %b)", x, y, cin, cout, sum);
    $finish();
    end
  endtask

endmodule