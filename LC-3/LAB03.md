## LAB03 实验报告

### 核心思路

#### 原代码

```assembly
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
Num     .FILL #1023
		.END
```

- 原思路分析
  - 首先对n <= 2 的情况进行特判， 用PUT对R7进行特殊装载；
  - 然后将R7, R6, R5, R4进行初始化， 将F(3)装入R7，即在LOOP循环中加入对n = 3的特判；
  - 然后在LOOP中利用非递归的求数列算法。

- 优化思路

  - 尝试减少LOOP中的指令数，最好的情况是能在不增加甚至减少LOOP外指令的同时还能减少LOOP中的指令数，而增加LOOP外指令以换取LOOP内指令的减少亦可以接受。

    - 首先对于LOOP而言，R0的自减与跳转指令是必要的：

      ```assembly
      LOOP	ADD R0, R0, #-1
      		BRz END
      		BRnzp LOOP
      END		HALT
      ```

      由于原代码使用的是无条件跳转，所以需要一条额外的跳转指令以在R0减小至0时结束循环——显然我们可以将其缩减为两条：

      ```assembly
      LOOP	ADD R0, R0, #-1
      		BRp LOOP
      END		HALT
      ```

      事实上原代码使用三条指令的原因是想加入n = 3作为特，而在修改后显然并不能满足这一条件——但在LOOP里增加一条指令用来执行一条特判有些得不偿失，所以这样的修改可以认为具有一定的收益。

    - 在修改后PUT指令不再能写在跳转指令之后，否则会产生额外的执行。原代码中利用了一次跳转指令：

      ```assembly
              ADD R0, R0, #-2     ;R0 = R0 - 2
              BRnz PUT
      PUT     ADD R7, R0, #2      ;R7 = R0 + 2
      END		HALT
      ```

      如果需要删去PUT，直接跳转至END，则可以先向R7装入特判所需要的值——F(n) = n：

      ```assembly
              ADD R7, R0, #0      ;n = f(n), n < 3
              ADD R0, R0, #-2     ;R0 = R0 - 2
              BRnz END
      END		HALT
      ```

      即相当于将PUT指令提前，这样就完成了一条LOOP指令的删减。

    - LOOP指令更改后LOOP中采用的非递归算法思路如下：

      ```c
      int f0 = 1;
      int f1 = 1;
      int f2 = 2;
      int fn;
      while(n > 2){    
          fn = f2 + 2 * f0;    // (*)
          f0 = f1;    
          f1 = f2;    
          f2 = fn;
      }
      ```

      对于(*)式，需要两条汇编指令完成：

      ```assembly
              ADD R7, R4 ,R4      
              ADD R7, R7 ,R6      ;R7 = R6 + R4 + R4
      ```

      有没有可能将F(n) = F(n - 1) + 2 * F(n - 3)中的后一项改写为F‘(n - 3)，以达到使用一条指令完成加法的目的呢？观察原代码中更新所用到的指令：

      ```assembly
              ADD R4, R5, #0      ;R4 = R5
              ADD R5, R6, #0      ;R5 = R6
              ADD R6, R7, #0      ;R6 = R7
      ```

      其中R4储存F(n - 3)。那么我们可以仍旧用一条指令使其储存F’(n - 3):

      ```assembly
              ADD R4, R5, R5      ;R4 = R5 + R5
          	ADD R5, R6, #0      ;R5 = R6
          	ADD R6, R7, #0      ;R6 = R7
      ```

      这样就可以做到用一条指令更新R7（R7已提前储存R6对应的F(n - 1)）：

      ```assembly
           	ADD R7, R7 ,R4      ;R7 = R6 + R4 + R4
      ```

      LOOP即更新如下：

      ```assembly
      LOOP    ADD R7, R7, R4      ;R7 = R7 + R4
              AND R7, R7, R2      ;R7 = R7 AND R2(#1023)
              ADD R4, R5, R5      ;R4 = R5 + R5
              ADD R5, R6, #0      ;R5 = R6
              ADD R6, R7, #0      ;R6 = R7
              ADD R0, R0, #-1
              BRp LOOP·
      END     HALT
      ```

      对应的，初始化也要做相应的更改：

      ```assembly
      		ADD R7, R1, #2      ;R7 = F(2)
              ADD R6, R6, #2      ;R6 = F(2)
              ADD R5, R5, #1      ;R5 = F(1)
              ADD R4, R4, #2      ;R4 = 2F(0)
      ```

#### 优化代码

- 代码

  ```assembly
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
  ```

- 指令数（针对测试样例）

  - 优化前：
  
    - LOOP内9条指令，初始化7条指令，最后一次循环2条指令，故最终为
  
      > (n - 2) * 9 (n > 3)
  
    - 最终平均指令数：38944.8
  
  - 优化后：
  
    - LOOP内7条指令，初始化8条指令，故最终为
  
      > (n - 2) * 7 + 8 (n > 3)
  
    - 最终平均指令数：30298.4 

- 通过逐个尝试以得到最终ID。

