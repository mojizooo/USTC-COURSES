## DNS实验

### 林宸昊 PB20000034

1. ![image-20221002190445973](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002190445973.png)

   - IP地址为154.214.13.29（这真的是亚洲网站）。

2. ![image-20221002190733952](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002190733952.png)

   - 所查询为剑桥大学网址。

3. ![image-20221002192017938](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002192017938.png)

   - 使用第一个DNS服务器查询youtube.com的服务器（yahoo怎么试都超时，gmail也超时）。

4. ![image-20221002193509445](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002193509445.png)

   4-10

   - 查询报文：

   ![image-20221002194111400](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002194111400.png)

   - 响应报文：

   ![image-20221002194134080](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002194134080.png)

   - 由图可看出均使用UDP协议；

   - 查询的目标端口和响应的源端口均为53；

   - 查询报文发送到IP地址192.168.43.1，通过ipconfig查询得本地DNS服务器IP：

     ![image-20221002194549416](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002194549416.png)

     二者一致；

   - ![image-20221002194751375](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002194751375.png)

     由图可知为Type A，未包含answers；

     响应报文包含三个answers，具体为：

     ![image-20221002195001399](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002195001399.png)

     ![image-20221002195013595](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002195013595.png)

     ![image-20221002195031649](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002195031649.png)

   - ![image-20221002195215558](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002195215558.png)

     与上图中第二张图IP地址相同；

   - 没有，仅发出一次DNS查询。

5. 11-23

   - ![image-20221002200041948](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002200041948.png)

     ![image-20221002200104555](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002200104555.png)

     如图，二者均为53；

   - 查询地址是192.168.43.1，是默认本地DNS服务器地址；

   - ![image-20221002200243960](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002200243960.png)

     Type A，没有answers；

     响应报文包含如下三个answers：

     ![image-20221002200344677](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002200344677.png)

     整体截图如下：

     ![image-20221002200437161](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002200437161.png)

   - ![image-20221002200601455](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002200601455.png)

     ![image-20221002200646862](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002200646862.png)

     查询报文发送到192.168.43.1，与本地DNS服务器IP地址相同；

     Type NS，不包含answers；

     响应报文如下：

     ![image-20221002200821304](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002200821304.png)

     提供了8个域名服务器，并且均提供了IP地址；

   - 整体截图如下：

     ![image-20221002200919920](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002200919920.png)

   - ![image-20221002201025253](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002201025253.png)

     查询报文发送到96.7.49.64，并非本机DNS服务器地址，而是指定的域名服务器地址；

   - ![image-20221002201126512](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002201126512.png)

     Type A，无answers；

     响应报文包含一个answers：

     ![image-20221002201229711](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002201229711.png)

   - 整体截图如下：

     ![image-20221002201255708](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20221002201255708.png)