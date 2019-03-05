lbi r7, 0
lbi r0, 0
jal 0
lbi r0, 1023 //this instruction SHOULD execute; r0 should be positive if we sign extend correctly
halt