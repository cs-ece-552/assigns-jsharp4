jal 0           //put PC + 2 in r7 so test is valid for arbitrary PC position
addi r0, r7, 0  //duplicate r7 in r0 to avoid ambiguity when jalr writes to r7
jalr r0, 4      //jump over zero instructions, (PC + 2) + 2 -> next instruction
lbi r1, -127    //this instruction SHOULD execute; r1 should be negative if we sign-extend correctly
halt
