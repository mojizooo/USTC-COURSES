## TCP

### 林宸昊 PB20000034

1. ![image-20221018183816997](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018183816997.png)

   - IP地址即为本机地址：192.168.43.112
   - TCP端口号为：8524

2. - IP地址为：128.119.245.12
   - TCP端口号为：80

3. 由于直接采用本机的实验数据包，故与第一问相同；

4. - 仍由上图，序列号为0；

   - ![image-20221018184216940](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018184216940.png)

     通过标志段中的位来判断。

5. ![image-20221018184351188](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018184351188.png)

   - 序列号为0；

   - ACK值为1；

   - ACK = Seq + 1；

   - ![image-20221018184517559](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018184517559.png)

     同样通过标志段置位；

6. ![image-20221018184834150](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018184834150.png)

   - 如图，序列号为1；

7. - 区段一：

     ![image-20221018192207319](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018192207319.png)

     ![image-20221018191928525](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018191928525.png)

     ![image-20221018192628506](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018192628506.png)

     序列号：1

     发送时间：36.023824000

     长度：707

     到达时间：36.259765000

     RTT：0.235941000

     ERTT：0.235941000

   - 区段二：

     ![image-20221018192852407](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018192852407.png)

     序列号：708

     发送时间：36.023959000

     长度：1360

     未接收到对应ACK包，无法分析。

   - 区段三：

     ![image-20221018193238709](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018193238709.png)

     序列号：2068

     发送时间：36.023959000

     长度：1360

     未接收到对应ACK包，无法分析。

   - 区段四：

     ![image-20221018193407333](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018193407333.png)

     ![image-20221018193458814](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018193458814.png)

     ![image-20221018193509155](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018193509155.png)

     序列号：3428

     发送时间：36.023959000

     长度：1360

     到达时间：36.259765000

     RTT：0.235806000

     ERTT：0.875 * 0.235941000 + 0.125 * 0.235806000 = 0.235924125

   - 区段五：

     ![image-20221018193733889](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018193733889.png)

     序列号：4788

     发送时间：36.023959000

     长度：1360

     未接收到ACK。

   - 区段六：

     ![image-20221018193847523](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018193847523.png)

     序列号：6148

     发送时间：36.023959000

     长度：1360

     未接收到ACK。

8. 如上。

9. 对于服务器，win = 229， 对于主机，win = 131840。缺少接收器缓冲空间确实会限制发送方传送TCP区段，因为TCP采用的流量控制服务将会消除接收方缓存溢出的可能，使得发送方的速率下降至与接收方速率相匹配。

10. 没有重传区段，查看时间序列图呈现持续递增趋势：

    ![image-20221018200031990](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018200031990.png)

11. 除了初始的707bytes外，一般确认1360bytes。有这种情况：

    ![image-20221018200715072](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018200715072.png)

12. > 平均吞吐量 = 总传输数据量（比特）F  /  总时间 T

    ![image-20221018201139031](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018201139031.png)

    ![image-20221018201152138](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018201152138.png)

    > 平均吞吐量 = 153028 / 0.993182 = 154.078kb/s

13. ![image-20221018200031990](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018200031990.png)

    慢启动开始：

    ![image-20221018202045948](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018202045948.png)

    慢启动结束：

    ![image-20221018202124266](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018202124266.png)

    拥塞避免：

    ![image-20221018202215814](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221018202215814.png)

    与理想化行为相比，指数增长的速率非常大，几乎呈现直线型增长，而拥塞避免则相比之下也呈直线（几乎看不到线性）。除此之外，慢启动带来的时间延长也比理想化情况高很多，对于一些数据量小的文件，为了解决拥塞带来的慢启动时延可能反而会延长发送到达的时间，可见实际中并非时刻有所裨益。