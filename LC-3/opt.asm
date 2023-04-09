        .ORIG x3000
        ADD R7, R0, #0      ;n = f(n), n < 3
        ADD R0, R0, #-2     ;R0 = R0 - 2
        BRnz END
        LD R2, Num          ;R2 = 1023
        ADD R7, R1, #2      ;R7 = F(2)
        ADD R6, R6, #2      ;R6 = F(2)
        ADD R5, R5, #1      ;R5 = F(1)
        ADD R4, R4, #2      ;R4 = 2F(0)
LOOP    ADD R7, R7, R4      ;R7 = R7 + R4
        AND R7, R7, R2      ;R7 = R7 AND R2(#1023)
        ADD R4, R5, R5      ;R4 = R5 + R5
        ADD R5, R6, #0      ;R5 = R6
        ADD R6, R7, #0      ;R6 = R7
        ADD R0, R0, #-1
        BRp LOOP·
END     HALT
Num     .FILL #1023
Fa      .FILL #930
Fb      .FILL #2
Fc      .FILL #30
Fd      .FILL #18
        .END