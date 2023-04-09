## IP

### 林宸昊 PB20000034

1. ![QQ图片20221111213359](C:\Users\lenovo\Desktop\QQ图片20221111213359.png)

   - IP地址：114.214.185.201

2. ![image-20221111213452200](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221111213452200.png)

   - 协议字段与上层协议字段均为1；

3. ![image-20221111213846271](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221111213846271.png)

   - header length = 20 bytes;
   - payload = total length - header length = 36 bytes;

4. ![image-20221111214038609](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221111214038609.png)

   - MF = 0, Fragment offset = 0, 未分段；

5. - Identification,  Header Checksum always changed;

6. - 必须保持不变：

     > Version：通信双方使用版本必须一致；
     >
     > Header Length：首部长度，用于说明首部字节数且唯一确定；
     >
     > DSCP：默认为0，不启用分区服务；

   - 保持不变：

     > ECN：为0，表示非ECT能力传输；
     >
     > Total Length：已在抓包前固定；
     >
     > Fragment offset：分片偏移，相对于原始报文开头的偏移量，同一个包中不会更改；
     >
     > Src，Dst：源地址和目标地址作为发送接收端不会更改；
     >
     > Protocol：都是ICMP协议；

   - 必须更改：

     > Identification：用于唯一标识某个报文以及其所有分片；
     >
     > TTL：经过的每个路由器都会将此字段减1，等于0时不再传送直接丢弃；
     >
     > Header Checksum：每一次路由器都会将重新计算出的首部检验和与此比较，不一致会直接丢弃；

7. ![image-20221111220110017](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221111220110017.png)

   ![image-20221111220120940](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221111220120940.png)

   每一个报文都有独特标识，会持续改变，使得报文可以被唯一确定；

8. ![image-20221111220309624](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221111220309624.png)

9. - ID字段改变，TTL字段保持不变，因为预设默认值都相同，超时代表均被扣减至0，最后一个路由器会发送icmp信息包括此TTL，因此都是一样的；

10. ![image-20221111221008920](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221111221008920.png)

    - 如图，已被分段；

11. ![image-20221111221357595](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221111221357595.png)

    - Flags的偏移指示它已被分段，数据报长度为1500字节；

12. ![image-20221111221605971](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221111221605971.png)

    - 根据Flags偏移可以确定这不是第一个数据段，MF指示后面已经没有数据段了；

13. - Flags， Header Checksum；

14. ![image-20221111221852692](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221111221852692.png)

    - 三个；

15. - Total Lengths, ID, Header Checksum