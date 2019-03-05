jal 0
addi r0, r7, 0
jalr r0, 4
lbi r1, -127 //this instruction SHOULD execute; r1 should be negative if we sign-extend correctly
halt
