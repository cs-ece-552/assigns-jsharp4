lbi r1, 0       //zero r1, r2, r3 to check for value change after jalr
lbi r2, 0
lbi r3, 0
jal 0           //put PC + 2 in r7 so test is valid for arbitrary PC position
addi r0, r7, 0  //duplicate r7 in r0 to avoid ambiguity when jalr writes to r7
jalr r0, 10     //jump over 3 instructions, (PC + 2) + 8, 8/2 -> execute fourth instruction forward
lbi r1, 1       //shouldnt execute
lbi r2, 2       //shouldnt execute
lbi r3, 3       //shouldnt execute
lbi r1, 127     //this instruction SHOULD execute; r1 should be positive if we sign-extend correctly
