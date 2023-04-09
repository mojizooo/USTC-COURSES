## HW1

#### 	A+B

- 基本数据结构

  ```go
  type MerkleTree struct{
  	RootNode *MerkleNode
  	Leaves   []*MerkleNode	//储存所有初始叶子节点（不包括后续复制）
  }
  
  type MerkleNode struct {
  	Left   *MerkleNode
  	Mid	   *MerkleNode
  	Right  *MerkleNode
  	Parent *MerkleNode		//用于记录父结点
  	Data   []byte
  	merkle_path [][]byte	//在生成树时一并生成该叶节点的SPV证明路径
  	index bool				//用于指示叶子结点所属位置，1为left，2为mid，3为right
  }
  ```

- 结点生成

  ```go
  func InitNode(data []byte, left *MerkleNode, mid *MerkleNode, right *MerkleNode) *MerkleNode {
  	node := MerkleNode{nil, nil, nil, nil}
  
  	if left == nil {
  		node.Data = Hash(data)
  	}
      //构建树的过程中若遇到空节点则复制最近的结点
  	else if mid == nil {
  		node = InitNode(nil, left, left, left)
  	}
  	else if right == nil{
  		node = InitNode(nil, left, mid, mid)
  	}
  	else {
  		PreHash := append(left.Data, mid.Data, right.Data)
  		node.Data = Hash(PreHash)
  		left.Parent = node
  		left.index = 0
  		mid.Parent = node
  		mid.index = 1
  		right.Parent = node
  		right.index = 2
  	}
  
  	node.Left = left
  	node.Mid = mid
  	node.Right = right
  
  	return &node
  }
  ```

- 生成树，同时生成底层叶节点的SPV路径

  ```go
  func InitTree(data [][]byte) *MerkleTree {
  	nodes := []MerkleNode
  	Len := len(data)
  	
      //首先生成底层叶节点
  	for _, chunk : range data {
  		node := InitNode(chunk, nil, nil, nil)
  		nodes = append(nodes, *node)
  	}
      
      //将
  	if Len % 3 != 0 {
  		Len = (Len / 3 + 1) * 3
  		for i := 0; i < Len - len(data); i++ {
  			nodes = append(nodes, nodes[len(nodes) - 1]);
  		}
  	}
  
  	T := MerkleTree{nil, nodes}
  
  	temp_nodes := nodes
  
  	//在生成树的过程中同时构建SPV路径免去查找遍历的过程
  	for i := 0; i <= int_log(Len, 3); i++ {//i为树高向下取整
  		temp := []MerkleNode
  
  		//建立SPV路径
  		for j := 0; j < Len; j++ {
  			parent := nodes[j].Parent
  			pos := nodes[j].index
  			for k := 0; k < i; k++ {
  				pos = parent.index
  				parent = parent.Parent
  			}
  			if pos == 0 {
  				nodes[j].merkle_path = append(nodes[j].merkle_path, parent.Mid.Data, parent.Right.Data)
  			}
  			if pos == 1 {
  				nodes[j].merkle_path = append(nodes[j].merkle_path, parent.Left.Data, parent.Right.Data)
  			}
  			else {
  				nodes[j].merkle_path = append(nodes[j].merkle_path, parent.Mid.Data, parent.Left.Data)
  			}
  		} 
  
  		//生成树
  		for j := 0; j < len(temp_nodes); j += 3 {
  			node := InitNode(nil, &temp_nodes[j], &temp_nodes[j+1], &temp_nodes[j+2])
  			temp = append(temp, *node)
  		}
  		temp_nodes = temp
  	}
  
  	T.RootNode := &nodes[0]
  
  	return &T
  
  }
  ```

- 路径长度为$\lceil{\log_{3}n}\rceil * 2$，其中$n$为交易序列长度

- 直接根据序号查询并返回路径即可

  ```go
  func CheckPath(i int64, T *MerkleTree) [][]byte {
  	return T.Leaves[i].merkle_path
  }
  ```

#### 	C

- 通过根据路径中的hash得到sibling之后进行求和Hash验证，最后与根hash比对即可

  ```go
  func SPVVerify(merkle_root []byte, path [][]byte) bool {
  	var []byte temp
  	for i := 0; i < len(path); i += 2 {
  		temp = Hash(get_sibling(path[i], path[i+1]) + path[i] + path[i+1])
  	}
  	return temp == merkle_root
  }
  ```

#### D

- 当交易数量较大时，使用三叉Merkle树的优势在于，三叉Merkle树可以将交易块进行更多的拆分以减少每个节点的哈希值计算量。也正因如此，三叉树可以用同样的结点储存比二叉树更多的交易以减少存储空间的需求。

  但使用三叉Merkle树也有一些缺陷，与二叉树相比，三叉树需要处理更多的节点类型和连接方式，即可能需要更复杂的代码和算法来构建和验证，使得三叉树的实现较二叉树上升一个难度。