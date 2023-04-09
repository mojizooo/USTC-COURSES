package main

type MerkleTree struct{
	RootNode *MerkleNode
	Leaves   []*MerkleNode
}

type MerkleNode struct {
	Left   *MerkleNode
	Mid	   *MerkleNode
	Right  *MerkleNode
	Parent *MerkleNode
	Data   []byte
	merkle_path [][]byte
	index bool
}

func InitTree(data [][]byte) *MerkleTree {
	nodes := []MerkleNode
	Len := len(data)
	
	for _, chunk : range data {
		node := InitNode(chunk, nil, nil, nil)
		nodes = append(nodes, *node)
	}

	if Len % 3 != 0 {
		Len = (Len / 3 + 1) * 3
		for i := 0; i < Len - len(data); i++ {
			nodes = append(nodes, nodes[len(nodes) - 1]);
		}
	}

	T := MerkleTree{nil, nodes}

	temp_nodes := nodes

	//build SPV path in the meantime to ger rid of check for path every time
	for i := 0; i <= int_log(Len, 3); i++ {
		temp := []MerkleNode

		//build merkle_path
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

		//build tree
		for j := 0; j < len(temp_nodes); j += 3 {
			node := InitNode(nil, &temp_nodes[j], &temp_nodes[j+1], &temp_nodes[j+2])
			temp = append(temp, *node)
		}
		temp_nodes = temp
	}

	T.RootNode := &nodes[0]

	return &T

}

func InitNode(data []byte, left *MerkleNode, mid *MerkleNode, right *MerkleNode) *MerkleNode {
	node := MerkleNode{nil, nil, nil, nil}

	if left == nil {
		node.Data = Hash(data)
	}
	else if mid == nil {
		node = InitNode(nil, left, left, left)
	}
	else if right == nil{
		node = InitNode(nil, left, mid, mid)
	}
	else {
		PreHash := append(left.Data, mid.Data, right.Data)
		node.Data = Hash(PreHash)
		Left.Parent = node
		Left.index = 0
		Mid.Parent = node
		Mid.index = 1
		Right.Parent = node
		Right.index = 2
	}

	node.Left = left
	node.Mid = mid
	node.Right = right

	return &node
}

func CheckPath(i int64, T *MerkleTree) [][]byte {
	return T.Leaves[i].merkle_path
}

func SPVVerify(merkle_root []byte, path [][]byte) bool {
	var []byte temp
	for i := 0; i < len(path); i += 2 {
		temp = Hash(get_sibling(path[i], path[i+1]) + path[i] + path[i+1])
	}
	return temp == merkle_root
}
