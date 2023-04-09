        .ORIG x3000
        ADD R0, R0, #-2     ;R0 = R0 - 2
        BRnz PUT
        LD R2, Num          ;R2 = 1023
        ADD R7, R7, #4      ;R7 = F(3)
        ADD R6, R6, #2      ;R6 = F(2)
        ADD R5, R5, #1      ;R5 = F(1)
        ADD R4, R4, #1      ;R4 = F(0)
LOOP    ADD R0, R0, #-1     ;R0 = R0 - 1
        BRz END
        ADD R4, R5, #0      ;R4 = R5
        ADD R5, R6, #0      ;R5 = R6
        ADD R6, R7, #0      ;R6 = R7
        ADD R7, R4 ,R4      
        ADD R7, R7 ,R6      ;R7 = R6 + R4 + R4
        AND R7, R7, R2      ;R7 = R7 AND R2(#1023)
        BRnzp LOOP
PUT     ADD R7, R0, #2      ;R7 = R0 + 2
END     HALT