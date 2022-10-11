module mux4x1 (in, sel, out);
    input [3:0] in;
    input [1:0] sel;
    output out;

    wire [1:0] sel_bar;
    wire in0s0, in1s1, in2s2, in3s3;

    not n1 (sel_bar[0], sel[0]);
    not n1 (sel_bar[1], sel[1]);

    and a1 (in0s0, in[0], sel_bar[1], sel_bar[0]);
    and a2 (in1s1, in[1], sel_bar[1], sel[0]);
    and a3 (in2s2, in[2], sel[1], sel_bar[0]);
    and a4 (in3s3, in[3], sel[1], sel[0]);

    or o1 (out, in0s0, in1s1, in2s2, in3s3);
endmodule
//Testbench

module tb_mux4x1;
    reg [3:0] in;
    reg [1:0] sel;
    wire out;

    
    parameter STDIN = 32'h8000_0000;
    integer testid;
    integer ret;

    mux4x1 DUT (in, sel, out);

    initial begin
        //$monitor($time, "(in = %b, sel = %b, out = %b)", in, sel, out);
        ret = $fscanf(STDIN, "%d", testid);
        case(testid)
            0: begin #5 in = 4'b0001; sel = 2'b10; end
	        1: begin #5 in = 4'b0001; sel = 2'b00; end
	        2: begin #5 in = 4'b1001; sel = 2'b01; end
	        3: begin #5 in = 4'b1001; sel = 2'b11; end
	        4: begin #5 in = 4'b0101; sel = 2'b10; end
	        5: begin #5 in = 4'b0000; sel = 2'b10; end
	        6: begin #5 in = 4'b1000; sel = 2'b00; end
	        7: begin #5 in = 4'b1000; sel = 2'b11; end
            default: begin
	            $display("Bad testcase id %d", testid);
	            $finish();
	        end
        endcase
        #5;
	    if ( (testid == 0 && out == 1'b0) || (testid == 1 && out == 1'b1) ||
	         (testid == 2 && out == 1'b0) || (testid == 3 && out == 1'b1) || 	
             (testid == 4 && out == 1'b1) || (testid == 5 && out == 1'b0) || 	
             (testid == 6 && out == 1'b0) || (testid == 7 && out == 1'b1) ) 
	        pass();
	    else
	        fail();
        
    end
    task fail; 
        begin 
            $display("Fail: (in = %b, sel = %b) != (out = %b)", in, sel, out);
            $finish();
        end
    endtask
    task pass; 
        begin
            $display("Pass:  (in = %b, sel = %b) = (out = %b)", in, sel, out);
            $finish();
        end
    endtask
endmodule