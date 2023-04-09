        .ORIG x3000
        ST R5, MOD      ; used for modulus operation
        ADD R1, R1, #1  
        ADD R2, R2, #1
        ADD R3, R3, #2
        ADD R7, R0, #0  ; if n < 3
        ADD R4, R0, #-3 ; just take n as f(n) 
        BRn OVER
LOOP    ADD R7, R1, R1
        ADD R7, R7, R3  ; calculate R7
        AND R7, R7, R5  ; modulus operation
        ADD R1, R2, #0
        ADD R2, R3, #0
        ADD R3, R7, #0  ; update the latest three
        ADD R0, R0, #-1
        ADD R4, R0, #-3 ; if n < 3, finish the loop, else go on
        BRzp LOOP
OVER    HALT
MOD     .BLKW #1
Fa      .FILL #930
Fb      .FILL #1
Fc      .FILL #1
Fd      .BLKW #1
        .END



