//Q-learning accelerator module

module Q_learning_acc(clk, en, action, state, next_state,  reward, gamma, alpha, result);
  input clk,en;
  input[3:0] action;
  input [5:0] state, next_state; //size?
  input [15:0] reward; 
  input [15:0] gamma;
  input [15:0] alpha;
  input [15:0] result;

  //wiring
  wire[15:0] out_ram_1,
             out_ram_2,
             out_ram_3,
             out_ram_4,
             out_ram_5,
             out_ram_6,
             out_ram_7,
             out_ram_8,
             out_ram_9,
             out_ram_10,
             out_ram_11,
             out_ram_12,
             out_ram_13,
             out_ram_14,
             out_ram_15;
    
    wire [3:0] state_addr,
               next_state_addr;

    //decoder to ram wire
    wire en1,
         en2,
         en3,
         en4,
         en5,
         en6,
         en7,
         en8,
         en9,
         en10,
         en11,
         en12,
         en13,
         en14,
         en15;

    //new q value wire
    reg [15:0] new_q_value;

    //wire output mux
    wire[15:0] q_value_selected;
  
    //wire q maximum
    wire[15:0]  q_max; 

  //module instantiation
    action_ram ram_1(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en1),
                   .data_in(new_q_value),
                   .data_out(out_ram_1));

    action_ram ram_2(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en2),
                   .data_in(new_q_value),
                   .data_out(out_ram_2));               

    action_ram ram_3(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en3),
                   .data_in(new_q_value),
                   .data_out(out_ram_3));

    action_ram ram_4(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en4),
                   .data_in(new_q_value),
                   .data_out(out_ram_4));

    action_ram ram_5(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en5),
                   .data_in(new_q_value),
                   .data_out(out_ram_5));

    action_ram ram_6(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en6),
                   .data_in(new_q_value),
                   .data_out(out_ram_6));

    action_ram ram_7(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en7),
                   .data_in(new_q_value),
                   .data_out(out_ram_7));

    action_ram ram_8(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en8),
                   .data_in(new_q_value),
                   .data_out(out_ram_8));

    action_ram ram_9(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en9),
                   .data_in(new_q_value),
                   .data_out(out_ram_9));

    action_ram ram_10(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en10),
                   .data_in(new_q_value),
                   .data_out(out_ram_10));

    action_ram ram_11(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en11),
                   .data_in(new_q_value),
                   .data_out(out_ram_11));

    action_ram ram_12(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en12),
                   .data_in(new_q_value),
                   .data_out(out_ram_12));

    action_ram ram_13(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en13),
                   .data_in(new_q_value),
                   .data_out(out_ram_13));

    action_ram ram_14(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en14),
                   .data_in(new_q_value),
                   .data_out(out_ram_14));
    
    action_ram ram_15(.clk(clk), 
                   .en(en), 
                   .wr_addr(state_addr),
                   .rd_addr(next_state_addr),
                   .write_en(en15),
                   .data_in(new_q_value),
                   .data_out(out_ram_15));

    //multiplexer 16 to 1
    Mux16to1 mux16to1(.sel(action),
                         .d1(out_ram_1),
                         .d2(out_ram_2),
                         .d3(out_ram_3),
                         .d4(out_ram_4),
                         .d5(out_ram_5),
                         .d6(out_ram_6),
                         .d7(out_ram_7),
                         .d8(out_ram_8),
                         .d9(out_ram_9),
                         .d10(out_ram_10),
                         .d11(out_ram_11),
                         .d12(out_ram_12),
                         .d13(out_ram_13),
                         .d14(out_ram_14),
                         .d15(out_ram_15), 
                         .dout(q_value_selected));

//this is new
    //Decoder
    Decoder Decoder(.at(action),
                   .en1(en1),
                   .en2(en2),
                   .en3(en3),
                   .en4(en4),
                   .en5(en5),
                   .en6(en6),
                   .en7(en7),
                   .en8(en8),
                   .en9(en9),
                   .en10(en10),
                   .en11(en11),
                   .en12(en12),
                   .en13(en13),
                   .en14(en14),
                   .en15(en15));
  
    //Max_Block
  Max_Block Max_Block(.clk(clk),
                  .Q_Act1(out_ram_1),
                  .Q_Act2(out_ram_2),
                  .Q_Act3(out_ram_3),
                  .Q_Act4(out_ram_4),
                  .Q_Act5(out_ram_5),
                  .Q_Act6(out_ram_6),
                  .Q_Act7(out_ram_7),
                  .Q_Act8(out_ram_8),
                  .Q_Act9(out_ram_9),
                  .Q_Act10(out_ram_10),
                  .Q_Act11(out_ram_11),
                  .Q_Act12(out_ram_12),
                  .Q_Act13(out_ram_13),
                  .Q_Act14(out_ram_14),
                  .Q_Act15(out_ram_15),
                  .out(q_max));
    
    //Q updater

    QUpdater Qupdater(.old_Q(q_value_selected),
                      .max_Q(q_max),
                      .gamma(gamma),
                      .alpha(alpha),
                      .rt(reward),
                      .new_Q(result));

    always@(posedge clk) begin
      new_q_value <= result;
    end

endmodule
