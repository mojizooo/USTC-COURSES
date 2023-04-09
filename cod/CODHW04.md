### COD HW04

#### 1.

- ``` 
  0 1000 0101 0011 101100000000000
  ```

- ```
  429d8000
  ```

#### 2. 1) 39%; 2)12%; 3)77%

#### 3.

- ```
  0x00c6ba23 = 0000 0000 1100 0110 1011 1010 0010 0011
  		   = 0000000 01100 01101 011 10100 01000 11
  		   = M[x[13] + 20] = x[12][63:0]
  ```

- 1) ALUOp 为00;
  2) ALU控制线为0010;

- PC +4. 1 -> 3 -> 12 -> 1.

- ALU 为Reg[x13]以及0x00000014;

  Branch adder 为PC以及0x00000028；

  PC adder 为PC以及4；

#### 4.

- ```
  R-type
  total = RR + I-MEM + RF + MUX(R2 OR IMM) + ALU + MUX(ALU TO R) + RS
  	  = 40 + 235 + 160 + 45 + 230 + 45 + 15
  	  = 770ps
  ```

- ```
  ld
  total = RR + I-MEM + RF + MUX + ALU + D-MEM + MUX + RS
  	  = 770 + 235 
  	  = 1005ps
  ```

- ```
  sd
  total = RR + I-MEM + RF + MUX + ALU + D-MEM
   	  = 40 + 235 + 160 + 45 + 230 + 235
   	  = 945ps
  ```

- ```
  beq
  total = RR + I-MEM + RF + MUX + ALU + SG + MUX + RS
  	  = 40 + 235 + 160 + 45 + 230 + 10 + 45 + 15
  	  = 780ps
  ```

- ```
  I-type
  total = RR + I-MEM + RF + MUX + ALU + MUX + RS
  	  = 770ps
  ```

- 1005ps，即ld的执行延迟
