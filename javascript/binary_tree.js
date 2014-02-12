(function(root){
	var DataStructures = root.DataStructures = (root.DataStructures || {});

	var BinaryNode = DataStructures.BinaryNode = function(key) {
		this.key = key;
		this.left = null;
		this.right = null;
		this.parent = null;
	}

	var BinaryTree = DataStructures.BinaryTree = function() {
		this.root = new BinaryNode();
	}

	BinaryTree.prototype.recursiveInsert = function(key, node, parent) {
		if (node == null) {
			if (parent == null){
				//no parent or node, set currNode to root
				var currNode = this.root;
			} else {
				//parent exists, but the node doesnt, create node with key at this point
				var newNode = new BinaryNode(key)
				newNode.parent = parent
				parent.key >= key ? parent.left = newNode : parent.right = newNode
				return newNode
			}
		} else {
			var currNode = node;
		}

		if (currNode.key == null){
			//first insert, set root key to key
			return currNode.key = key
		}	else {
			if (currNode.key >= key) {
				//go down the tree
				return this.recursiveInsert(key, currNode.left, currNode);
			} else {
				//go down the tree
				return this.recursiveInsert(key, currNode.right, currNode);
			}
		}

	}

	BinaryTree.prototype.isBalancedTree = function() {
		// return this.getDepth(this.root.left) - this.getDepth(this.root.right)
	}	

	BinaryTree.prototype.getDepth = function(node, depth) {
		if (depth == null) {
			depth = 0;
		}
		if (node == null) {
			return depth;
		} else {
			depth += 1;
			rightDepth = this.getDepth(node.right, depth);
			leftDepth = this.getDepth(node.left, depth);
		}
		return rightDepth >= leftDepth ? rightDepth : leftDepth;
	}

	BinaryTree.prototype.balancedWeight = function(node) {
		if (!node) {
			return 0;
		}
		var leftWeight = this.balancedWeight(node.left);
		var rightWeight = this.balancedWeight(node.right);

		if (Math.abs(leftWeight - rightWeight) > 1) {
			return -1;
		}

		if (leftWeight == -1 || rightWeight == -1) {
			return -1;
		}

		return 1 + leftWeight + rightWeight;
	}

})(this);