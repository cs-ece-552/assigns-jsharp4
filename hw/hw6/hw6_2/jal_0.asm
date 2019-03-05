lbi r7, 0   //zero r7 to make sure it isn't accidentally PC + 2
lbi r0, 0   //zero r0 so it isn't accidentally 127
jal 2       //jump over one instruction
lbi r0, 127 //this instruction shouldn't execute
halt
