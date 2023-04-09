## LAB02 实验报告

### 核心思路

- 求F(n)

  - 对于F(1), F(2)可以采取特判——F(n) = n；

  - 对于n > 2，可以采用非递归的斐波那契求和算法

    ```c
    int f0 = 1;
    int f1 = 1;
    int f2 = 2;
    int fn;
    while(n > 2){
        fn = f2 + 2 * f0;
        f0 = f1;
        f1 = f2;
        f2 = fn;
    }
    ```

  - 对于mod1024，可以与1023的16位二进制数相与以舍弃大于10位之后的数（因为他们必然能被1024整除）。

### L版本代码

- 初始化，即向R1, R2, R3 分别装入F(0), F(1), F(2)

  ```assembly
          LD R5, MOD      ; used for modulus operation
          ADD R1, R1, #1  
          ADD R2, R2, #1
          ADD R3, R3, #2
  ```

- 特判，向R7装入n的值，若n小于3，直接输出

  ```assembly
          ADD R7, R0, #0  ; if n < 3
          ADD R4, R0, #-3 ; just take n as f(n) 
          BRn OVER
  ```

- 递推求和

  ```assembly
  LOOP    ADD R7, R3, #0
          ADD R7, R7, R1  
          ADD R7, R7, R1	; calculate
          AND R7, R7, R5  ; modulus operation
          ADD R1, R2, #0
          ADD R2, R3, #0
          ADD R3, R7, #0  ; update the latest three
          ADD R0, R0, #-1
          ADD R4, R0, #-3 ; if n < 3, finish the loop, else go on
          BRzp LOOP
  ```

- 总体代码

  ```assembly
          .ORIG x3000
          LD R5, MOD      ; used for modulus operation
          ADD R1, R1, #1  
          ADD R2, R2, #1
          ADD R3, R3, #2
          ADD R7, R0, #0  ; if n < 3
          ADD R4, R0, #-3 ; just take n as f(n) 
          BRn OVER
  LOOP    ADD R7, R3, #0
          ADD R7, R7, R1  
          ADD R7, R7, R1
          AND R7, R7, R5  ; calculate R7
          ADD R1, R2, #0
          ADD R2, R3, #0
          ADD R3, R7, #0  ; update the latest three
          ADD R0, R0, #-1
          ADD R4, R0, #-3 ; if n < 3, finish the loop, else go on
          BRzp LOOP
  OVER    HALT
  MOD     .FILL x03FF
  ```

  共19行。