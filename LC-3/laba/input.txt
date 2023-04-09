        .ORIG X3000
        AND R4, R4, #0
        ADD R4, R4, #2
        AND R1, R1, #0
        ADD R1, R1, #1
        ADD R5, R1, #-5
        ADD R5, R5, R0
        BRn END
        JSR JUDGE
        ADD R1, R1, #-1
END     HALT
JUDGE   ADD R2, R4, #0
        NOT R2, R2
        ADD R2, R2, #1
        ADD R5, R0, #0
MOD     ADD R5, R2, R5
        BRp MOD
        BRn MUL
        RET
MUL     ADD R4, R4, #1
        ADD R5, R4, #0
        AND R3, R3, #0
M       ADD R3, R3, R4
        NOT R6, R3
        ADD R6, R6, #1
        ADD R6, R6, R0
        BRn END
        ADD R5, R5, #-1
        BRnp M
        BRnzp JUDGE
        .END
        