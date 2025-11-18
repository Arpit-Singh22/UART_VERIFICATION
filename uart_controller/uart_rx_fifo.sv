module uart_rx_fifo(
  input clk,
  input rstn,
  input push,
  input pop,
  input [10:0] data_in,
  output logic fifo_empty,
  output logic fifo_full,
  output logic[4:0] count,
  output logic[10:0] data_out);

logic[3:0] ip_count;
logic[3:0] op_count;
typedef logic[10:0] fifo_t;

fifo_t data_fifo[15:0];

always @(posedge clk)
  begin
    if(rstn == 0) begin
      count <= 0;
      ip_count <= 0;
      op_count <= 0;
      foreach(data_fifo[i]) begin
        data_fifo[i] = 0;
      end
    end
    else begin
      case({push, pop})
        2'b01: begin
                 if(count > 0) begin
                   op_count <= op_count + 1;
                   count <= count - 1;
                 end
               end
        2'b10: begin
                 if(count <= 5'hf) begin
                   ip_count <= ip_count + 1;
                   data_fifo[ip_count] <= data_in;
                   count <= count + 1;
                 end
               end
        2'b11: begin
                 op_count <= op_count + 1;
                 ip_count <= ip_count + 1;
                 data_fifo[ip_count] <= data_in;
               end
      endcase
    end
  end

always_comb
  data_out = data_fifo[op_count];

always_comb
  fifo_empty = ~(|count);

always_comb
  fifo_full = (count == 5'b10000);



endmodule: uart_rx_fifo

