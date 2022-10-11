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

module bus_multiplexer (D3, D2, D1, D0, SEL, DBUS);
    input [15:0] D3, D2, D1, D0;
    input [1:0] SEL;
    output [15:0] DBUS;

    mux4x1  M15 ({D3[15], D2[15], D1[15], D0[15]}, SEL, DBUS[15]);
    mux4x1  M14 ({D3[14], D2[14], D1[14], D0[14]}, SEL, DBUS[14]);
    mux4x1  M13 ({D3[13], D2[13], D1[13], D0[13]}, SEL, DBUS[13]);
    mux4x1  M12 ({D3[12], D2[12], D1[12], D0[12]}, SEL, DBUS[12]);
    mux4x1  M11 ({D3[11], D2[11], D1[11], D0[11]}, SEL, DBUS[11]);
    mux4x1  M10 ({D3[10], D2[10], D1[10], D0[10]}, SEL, DBUS[10]);
    mux4x1  M9 ({D3[9], D2[9], D1[9], D0[9]}, SEL, DBUS[9]);
    mux4x1  M8 ({D3[8], D2[8], D1[8], D0[8]}, SEL, DBUS[8]);
    mux4x1  M7 ({D3[7], D2[7], D1[7], D0[7]}, SEL, DBUS[7]);
    mux4x1  M6 ({D3[6], D2[6], D1[6], D0[6]}, SEL, DBUS[6]);
    mux4x1  M5 ({D3[5], D2[5], D1[5], D0[5]}, SEL, DBUS[5]);
    mux4x1  M4 ({D3[4], D2[4], D1[4], D0[4]}, SEL, DBUS[4]);
    mux4x1  M3 ({D3[3], D2[3], D1[3], D0[3]}, SEL, DBUS[3]);
    mux4x1  M2 ({D3[2], D2[2], D1[2], D0[2]}, SEL, DBUS[2]);
    mux4x1  M1 ({D3[1], D2[1], D1[1], D0[1]}, SEL, DBUS[1]);
    mux4x1  M0 ({D3[0], D2[0], D1[0], D0[0]}, SEL, DBUS[0]);

endmodule
//Testbench
module tb_bus_multiplexer;
    reg [15:0] D3, D2, D1, D0;
    reg [1:0] SEL;
    wire [15:0] DBUS;
    
    
    parameter STDIN = 32'h8000_0000;
    integer testid;
    integer ret;

    bus_multiplexer DUT (D3, D2, D1, D0, SEL, DBUS);

    initial begin
        //$monitor($time, "(D3 = %h, D2 = %h, D1 = %h, D0 = %h, SEL = %b, DBUS = %h)", D3, D2, D1, D0, SEL, DBUS);
        ret = $fscanf(STDIN, "%d", testid);
        case(testid)
            0: begin #5 D3 = 16'habcd; D2 = 16'h66cd; D1 = 16'hef12; D0 = 16'h1234; SEL = 2'b10; end
	        1: begin #5 D3 = 16'habcd; D2 = 16'h66cd; D1 = 16'hef12; D0 = 16'h1234; SEL = 2'b00; end
	        2: begin #5 D3 = 16'h0000; D2 = 16'hffff; D1 = 16'hcccc; D0 = 16'h9999; SEL = 2'b01; end
	        3: begin #5 D3 = 16'h0000; D2 = 16'hffff; D1 = 16'hcccc; D0 = 16'h9999; SEL = 2'b11; end
	        4: begin #5 D3 = 16'h0000; D2 = 16'h0000; D1 = 16'h0000; D0 = 16'h0000; SEL = 2'b10; end
	        5: begin #5 D3 = 16'h0000; D2 = 16'hdddd; D1 = 16'h0000; D0 = 16'h0000; SEL = 2'b10; end
	        6: begin #5 D3 = 16'h3344; D2 = 16'h0000; D1 = 16'h0000; D0 = 16'h0000; SEL = 2'b00; end
	        7: begin #5 D3 = 16'h3344; D2 = 16'h0000; D1 = 16'h0000; D0 = 16'h0000; SEL = 2'b11; end
            default: begin
	            $display("Bad testcase id %d", testid);
	            $finish();
	        end
        endcase
        #5;
	    if ( (testid == 0 && DBUS == 16'h66cd) || (testid == 1 && DBUS == 16'h1234) ||
	         (testid == 2 && DBUS == 16'hcccc) || (testid == 3 && DBUS == 16'h0000) || 	
             (testid == 4 && DBUS == 16'h0000) || (testid == 5 && DBUS == 16'hdddd) || 	
             (testid == 6 && DBUS == 16'h0000) || (testid == 7 && DBUS == 16'h3344) ) 
	        pass();
	    else
	        fail();
        
    end
    task fail; 
        begin 
            $display("Fail: (D3 = %h, D2 = %h, D1 = %h, D0 = %h, SEL = %b) != (DBUS = %h)", D3, D2, D1, D0, SEL, DBUS);
            $finish();
        end
    endtask
    task pass; 
        begin
            $display("Pass: (D3 = %h, D2 = %h, D1 = %h, D0 = %h, SEL = %b) = (DBUS = %h)", D3, D2, D1, D0, SEL, DBUS);
            $finish();
        end
    endtask
endmodule