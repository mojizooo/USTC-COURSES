## LAB06 实验报告

### 改写部分

***代码改写均使用C语言，对于寄存器使用8个短整型全局变量用于模拟。***

#### lab1l

- 将BR语句改为一个while循环

  ```assembly
  0001111111000000
  0001001001111111
  0000101111111101
  ```

  ```c
  int main(){
  	scanf("%hd %hd", &R0, &R1);
  	while(R1){
  		R7 += R0;
  		R1--;
  	}
  	printf("%hd\n", R7);
  	return 0; 
  }
  ```

- 

#### lab1p

- 利用&运算符实现移位操作

  ```assembly
  0101111111100000
  0001010111100001
  0101011001000010
  0000010000000001
  0001111111000000
  0001000000000000
  0001010010000010
  0000010000000001
  0000111111111001
  1111000000100101
  ```

  ```c
  int main(){
  	scanf("%hd %hd", &R0, &R1);
  	R7 = 0;
  	R2 = R7 + 1;
  	while(R2){
  		if(R2 & R1){
  			R7 = R7 + R0;
  		}
  		R0 = R0 + R0;
  		R2 = R2 + R2;
  	}
  	printf("%hd\n", R7);
  	return 0;
  }
  ```

#### fib

- 对于只能判nzp的BR语句，使用if语句替代

- 使用while语句代替LOOP

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
          ADD R7, R7, R1  ; calculate R7
          AND R7, R7, R5  ; modulus operation
          ADD R1, R2, #0
          ADD R2, R3, #0
          ADD R3, R7, #0  ; update the latest three
          ADD R0, R0, #-1
          ADD R4, R0, #-3 ; if n < 3, finish the loop, else go on
          BRzp LOOP
  OVER    HALT
  MOD     .FILL x03FF
          .END
  ```

  ```c
  int main(){
  	scanf("%hd", &R0);
  	R1 += 1;
  	R2 += 1;
  	R3 += 2;
  	R7 = R0;
  	if(R0 < 3){
  		printf("%hd\n", R7);
  		return 0;
  	}
  	else while(R0 >= 3){
  		R7 = R3;
  		R7 += R1;
  		R7 += R1;
  		R7 &= 1023;
  		R1 = R2;
  		R2 = R3;
  		R3 = R7;
  		R0--;
  	}
  	printf("%hd\n", R7);
  	return 0;
  }
  ```

#### fib_opt

- 同上，对while内语句做修改

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
          BRp LOOP
  END     HALT
  Num     .FILL #1023
          .END
  ```

  ```c
  int main(){
  	scanf("%hd", &R0);
  	R7 = R0;
  	R0 -= 2;
  	if(R0 <= 0){
  		printf("%hd\n", R7);
  		return 0;
  	}
  	R7 = R1 + 2;
  	R6 += 2;
  	R5 += 1;
  	R4 += 2;
  	while(R0 > 0){
  		R7 += R4;
  		R7 &= 1023;
  		R4 = R5 + R5;
  		R5 = R6;
  		R6 = R7;
  		R0 --;
  	}
  	printf("%hd\n", R7);
  	return 0;
  }
  ```

#### rec

- 由于涉及到PC与内存相关的操作，使用短整型数组代替内存，对于PC，直接计算出对应位置，并使用循环代替涉及PC跳转的操作。

  ```assembly
  1110010000001110
  0101000000100000
  0100100000000001
  1111000000100101
  0111111010000000
  0001010010100001
  0001000000100001
  0010001000010001
  0001001001111111
  0011001000001111
  0000010000000001
  0100111111111000
  0001010010111111
  0110111010000000
  1100000111000000
  0000000000000000
  0000000000000000
  0000000000000000
  0000000000000000
  0000000000000000
  0000000000000000
  0000000000000000
  0000000000000000
  0000000000000000
  0000000000000000
  0000000000000101
  ```

  ```c
  short int memory[128];
  int main(){
  	memory[25] = 5;
  	R2 = 15;
  	R0 = 0;
  	R7 = 3;
  	while(1){
  		memory[R2] = R7;
  		R2 += 1;
  		R0 += 1;
  		R1 = memory[25];
  		R1--;
  		memory[25] = R1;
  		if(R1) R7 = 12;
  		else break;
  	}
  	while(R7 == 12){
  		R2--;
  		R7 = memory[R2];
  	}
  	for(int i = 15; i < 26; i++){
  		printf("%d ", memory[i]);
  	}
  	printf("%d %d %d %d %d %d %d %d ", R0, R1, R2, R3, R4, R5, R6, R7);
  	return 0;
  }
  ```

#### mod

- 使用函数来实现"divided by eight"的功能。

  ```assembly
  0010001000010101
  0100100000001000
  0101010001100111
  0001001010000100
  0001000011111001
  0000001111111011
  0001000011111001
  0000100000000001
  0001001001111001
  1111000000100101
  0101010010100000
  0101011011100000
  0101100100100000
  0001010010100001
  0001011011101000
  0101101011000001
  0000010000000001
  0001100010000100
  0001010010000010
  0001011011000011
  0000101111111010
  1100000111000000
  0000000100100000
  ```

  ```c
  void div_by_8(){
  	R2 = 0;
  	R3 = 0;
  	R4 = 0;
  	R2++;
  	R3 += 8;
  	while(R3){
  		R5 = R3 & R1;
  		if(R5) R4 += R2;
  		R2 += R2;
  		R3 += R3;
  	}
  }
  
  int main(){
  	scanf("%hd", &R1);
  	while(1){
  		div_by_8();
  		R2 = R1 & 7;
  		R1 = R2 + R4;
  		if(R1 > 7) continue;
  		else if(R1 == 7) R1 -= 7;
  		break;
  	}
  	printf("%hd\n", R1);
  	return 0;
  }
  ```

#### prime

- 使用多个函数与函数之间的相互调用。

  ```c
  int mul(){
  	R3 += R4;
  	R6 = ~R3;
  	R6++;
  	R6 += R0;
  	if(R6 < 0) return 0;
  	return 1;
  }
  
  int WHILE(){
  	R4++;
  	R5 = R4;
  	R3 = 0;
  	while(R5){
  		if(mul() == 0) return 0;
  		else R5--;
  	}
  	return 1;
  
  }
  int judge(){
  	R2 = R4;
  	R2 = ~R2;
  	R2 += 1;
  	R5 = R0;
  	while(R5 > 0)
  		R5 += R2;
  	if(R5 == 0){
  		R1 -= 1;
  		return 0;
  	}
  	else {
  		if(WHILE())
  			return 1;
  		else return 0;
  	}
  
  }
  int main(){
  	scanf("%hd", &R0);
  	R4 += 2;
  	R1 += 1;
  	if(R0 < 4) return 0;
  	while(judge());
  	printf("%hd\n", R1);
  	return 0;
  }
  ```

### 思考部分

- ***how to evaluate the performance of your own high-level language programs***

  - 首先想到的是利用C语言自带的函数计算程序开始与结束的时间差，显然是一种可行方案：如clock方法，gettimeofday方法都可获取程序运行时长并且精度可以达到us级别，time方法的精度仅有ms级故不做考虑；

  - 可以通过计算各程序所涉及循环中语句执行次数，类似于将时间复杂度从O(n)这一情况再向下划分。对于空间复杂度以及处理时间，事实上在使用高级语言之后，这些不同所带来的差异是难以发现的，并且由于复杂程序所产生的代价亦是可以接受的，所以仍采用和汇编语言同样的方式作为评判；
  - 如fib和fib_opt的while循环中的语句数就有明显不同，显然二者的性能表现亦有较大不同。

- ***why is a high-level language easier to write than LC3 assembly***
  - 高级语言可以使用具有任意范围的判断语句，循环语句，并可以直接实现跳转，而并不会像汇编语言如果不满足跳转条件强制顺序执行下一条语句。正由于只有nzp的判断范围，汇编语言需要进行很多额外的操作，并且需要占用额外的寄存器作为临时结果的储存空间，同时由于顺序执行的特性，需要额外思考整体程序的框架，而在整个程序复杂的上升的时候可读性会有所下降，同样给程序的编写带来困难。
  - 除此之外，函数的调用也显然给高级语言带来很多便利，汇编语言只能在主程序中编写函数并且需要额外设置多重PC的跳转以实现多个函数的调用，同样带来困难。
  
- ***what instructions do you think need to be added to LC3?*** 

  - 可以通过增加一个寄存器来实现仅用一个指令将SR1 * SR2存入DR，在理想情况下甚至可以无视输入的正负，在内部进行调整从而减少源程序可能使用的循环或是子函数所带来的复杂度；
  - 可以将BR进行扩展，通过某一位IR进行模式选择，将当前条件码作为立即数进行利用以拓宽判断跳转的范围。

- ***is there anything you need to learn from LC3 for the high-level language you use?***
  
  - 关于PC的跳转与对应的运行；
  - 条件码的变化与BR的处理逻辑；
  - 对内存的操作以及直接间接寻址模式在高级语言中如何体现，etc.

