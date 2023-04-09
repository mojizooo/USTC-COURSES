## COD HW5

### 1.

1. 流水化：350ps；非流水化：1250ps，即全部顺序执行一次；
2. 流水化和非流水化均为1250ps；
3. ID；新周期为300ps；
4. 20% + 15% = 35%；
5. 45% + 20% = 65%。

### 2.

1. ```
   sd x29, 12(x16)		II	ID	EX	ME	WB
   ld x29, 8(16)			II	ID	EX	ME	WB
   sub x17, x15, x14			II	ID	EX	ME	WB
   beqz x17, label					ST	ST	II	ID	EX	ME	WB
   add x15, x11, x14							II	ID	EX	ME	WB
   sub x15, x30, x14								II	ID	EX	ME	WB			
   ```

​		其中ST代表停顿。

2. 不行。每次数据访问必然发生停顿，因为都需要取指令；因此无法通过重排避免。
3. NOP也需要取指令，因此显然无法用NOP解决；
4. 11% + 25% = 36%。

### 3.

1. 不会，因为周期取决于最慢的一级；
2. 可能可以。MEM和EX的重叠会消去load和需要用的load结果的指令之间的一个周期,有可能可以做到减少停顿数以提高性能;
3. 移除立即数偏移可能会增加额外的addi指令导致总指令数增加，使得性能降低。

### 4.

1. ```
   ld x10, 0(x13)      IF ID EX ME WB 
   ld x11, 8(x13)         IF ID EX ME WB 
   add x12, x10, x11         IF ID ST EX *ME WB 
   addi x13, x13, -16           IF ST ID EX *ME WB 
   bnez x12, LOOP                  ST IF ID EX *ME *WB 
   ld x10, 0(x13)                        IF ID EX ME WB 
   ld x11, 8(x13)                              IF ID EX ME WB 
   add x12, x10, x11                              IF ID ST EX *ME WB 
   addi x13, x13, -16                                IF ST ID EX *ME WB 
   bnez x12, LOOP                                          IF ID EX *ME *WB
   ```

2. 已用星号标出。事实上在全负荷工作时，这种情况并没有出现过。

