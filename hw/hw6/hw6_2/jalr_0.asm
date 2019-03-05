jal 0
addi r0, r7, 0
jalr r0, 2
lbi r1, 1023 //this instruction SHOULD execute; r1 should be negative if we sign-extend correctly
halt