lbi r1, 0
lbi r2, 0
lbi r3, 0
jal 0
addi r0, r7, 0
jalr r0, 10 
lbi r1, 1 //shouldnt execute
lbi r2, 2 //shouldnt execute
lbi r3, 3 //shouldnt execute
lbi r1, 127 //this instruction SHOULD execute; r1 should be positive if we sign-extend correctly
