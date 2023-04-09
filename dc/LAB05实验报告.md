## LAB05 实验报告

### 核心思路

- JUDGE部分用于判断是否r0能够被i整除，RET用作break；
- i的自增与while内的条件判断交由RET后的模块执行，因此在JUDGE前进行一次特判（i=2的情况）

### 代码部分

#### 初始化

- 由于未说明所有寄存器是否初始清0，故需要额外的清空操作

  ```assembly
          AND R4, R4, #0
          ADD R4, R4, #2	;i = 2
          AND R1, R1, #0
          ADD R1, R1, #1	;r1 = 1
  ```

- 由于JUDGE先于i的判断执行，故进行一次特判

  ```assembly
          ADD R5, R1, #-5	;R5 = -4
          ADD R5, R5, R0
          BRn END
          JSR JUDGE		;if r0 < 4, halt, else go on
          ADD R1, R1, #-1	;what happened after "break"
  END     HALT
  ```

#### JUDGE部分，即while内判断

- 判断是否整除可以采用累减的方法

  ```assembly
  JUDGE   ADD R2, R4, #0
          NOT R2, R2
          ADD R2, R2, #1	;R2 = -i
          ADD R5, R0, #0	;store result temporarily
  DIV     ADD R5, R2, R5	
          BRp DIV			;
          BRn WHILE		;not divisible, i++
          RET				;divisible, break
  ```

#### MUL部分，即while判断

- 由于已进行过第一次特判，故初始化时先自增

  ```assembly
  WHILE   ADD R4, R4, #1	;i++
          ADD R5, R4, #0	;store multiplier
          AND R3, R3, #0	;store result
  ```

- 在i * i的计算过程中我们即可以与r0进行比较，若满足while执行的条件即跳转至JUDGE进行下一次判断

  ```assembly
  MUL     ADD R3, R3, R4	
          NOT R6, R3
          ADD R6, R6, #1
          ADD R6, R6, R0
          BRn END				;if current result is bigger than r0, then halt
          ADD R5, R5, #-1
          BRnp M				;loop to calculate i * i
          BRnzp JUDGE			;after finished, jump to JUDGE
  ```

#### 整体代码

```assembly
        .ORIG X3000
        AND R4, R4, #0
        ADD R4, R4, #2	;i = 2
        AND R1, R1, #0
        ADD R1, R1, #1	;r1 = 1
        ADD R5, R1, #-5	;R5 = -4
        ADD R5, R5, R0
        BRn END
        JSR JUDGE		;if r0 < 4, halt, else go on
        ADD R1, R1, #-1	;what happened before "break"
END     HALT
JUDGE   ADD R2, R4, #0
        NOT R2, R2
        ADD R2, R2, #1	;R2 = -i
        ADD R5, R0, #0	;store result temporarily
DIV     ADD R5, R2, R5	
        BRp DIV			;keep minusing
        BRn WHILE		;not divisible, i++
        RET				;divisible, break
WHILE   ADD R4, R4, #1	;i++
        ADD R5, R4, #0	;store multiplier
        AND R3, R3, #0	;store result
MUL     ADD R3, R3, R4	
        NOT R6, R3
        ADD R6, R6, #1
        ADD R6, R6, R0
        BRn END			;if current result is bigger than r0, then halt
        ADD R5, R5, #-1
        BRnp MUL		;loop to calculate i * i
        BRnzp JUDGE		;after finished, jump to JUDGE
        .END
```

