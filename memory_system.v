module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output reg [7:0] memory
);
reg [7:0] Mem_in[3:0];
wire [7:0] Mem_out[3:0];
reg enable [3:0];

genvar i;
generate
    for (i = 0; i < 4; i = i + 1) begin
        byte_memory b_m(
        .data(Mem_in[i]),
        .store(enable[i]),
        .memory(Mem_out[i])
        );
    end
endgenerate
// we need the demux to assign the data
always @(*) begin
    memory <= Mem_out[addr];
    
    case(addr)
        2'b00: begin
        {Mem_in[0], Mem_in[1] , Mem_in[2] , Mem_in[3]} <= {data, 8'b0, 8'b0, 8'b0};
        {enable[0], enable[1] , enable[2] , enable[3]} <= {store, 1'b0, 1'b0, 1'b0};
        end
        2'b01: begin
        {Mem_in[0], Mem_in[1] , Mem_in[2] , Mem_in[3]} <= { 8'b0, data, 8'b0, 8'b0};
        {enable[0], enable[1] , enable[2] , enable[3]} <= {1'b0, store, 1'b0, 1'b0};
        end
        2'b10: begin
        {Mem_in[0], Mem_in[1] , Mem_in[2] , Mem_in[3]} <= {8'b0, 8'b0, data, 8'b0};
        {enable[0], enable[1] , enable[2] , enable[3]} <= {1'b0, 1'b0, store, 1'b0};
        end
        2'b11: begin
        {Mem_in[0], Mem_in[1] , Mem_in[2] , Mem_in[3]} <= {8'b0, 8'b0, 8'b0, data};
        {enable[0], enable[1] , enable[2] , enable[3]} <= {1'b0, 1'b0, 1'b0, store};
        end
    endcase

//    case(addr)
//        2'b00: memory <= Mem_out[0];
//        2'b01: memory <= Mem_out[1];
//        2'b10: memory <= Mem_out[2];
//        2'b11: memory <= Mem_out[3];
//    endcase
end
 //make the demux
 //data in 
 
 


    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr

    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs

    // you will need 2 demultiplexers:
    // 1. Demultiplex data -> selected byte
    // 2. Demultiplex store -> selected byte

    // and one multiplexer:
    // 1. Multiplex selected byte -> memory

endmodule