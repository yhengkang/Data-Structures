class AVLNode
	attr_accessor :value, :left, :right, :parent

	def initialize(value)
		@parent = nil
		@left = nil
		@right = nil
		@value = value
	end

	def get_depth
		depth = 0
		curr_node = self
		until curr_node.nil?
			depth += 1
			curr_node = curr_node.left || curr_node.right
		end
		depth
	end

	def get_balance_factor
		left_depth = self.left ? self.left.get_depth : 0
		right_depth = self.right ? self.right.get_depth : 0

		left_depth - right_depth
	end

end



class AVLTree
	attr_reader :root

	def initialize
		@root = AVLNode.new(nil)
	end

	def insert(value)
		recursive_insert(@root, value)
	end

	def recursive_insert(node, value)
		return node.value = value if node.value.nil?

		if node.value > value
			if node.left.nil?
				new_node = AVLNode.new(value)
				node.left = new_node
				new_node.parent = node

				recursive_balance(node)
			else
				recursive_insert(node.left, value)
			end
		else
			if node.right.nil?
				new_node = AVLNode.new(value)
				node.right = new_node
				new_node.parent = node

				recursive_balance(node)
			else
				recursive_insert(node.right, value)
			end
		end

	end

	def delete(value)
		
		curr_node = @root

		until curr_node.value == value
			return "Node not found" if node.nil?

			if value > curr_node.value
				curr_node = curr_node.right
			else
				curr_node = curr_node.left
			end
		end

		replacement_node = curr_node.left
		until replacement_node.right.nil?
			replacement_node = replacement_node.right
		end

		curr_node.value = replacement_node.value

		subtree = replacement_node.left
		parent = replacement_node.parent

		if subtree
			subtree.parent = parent
		end

		if parent
			parent.left == replacement_node ? parent.left = subtree : parent.right = subtree
		end

		replacement_node.left = nil
		replacement_node.right = nil
		replacement_node.parent = nil

	end

	def recursive_balance(node)
		return "Done balancing" if node.nil?

		if node.get_balance_factor > 1
			#LR case
			if node.left.get_balance_factor == -1
				rotate_left(node.left)
			end

			rotate_right(node)
		elsif node.get_balance_factor < -1
			#RL case
			if node.right.get_balance_factor == 1
				rotate_right(node.right)
			end

			rotate_left(node)
		end
		recursive_balance(node.parent)
	end

	def rotate_right(node)
		parent = node.parent
		child = node.left
		grandchild = node.left.right

		node.left = grandchild
		grandchild.parent = node if grandchild
		node.parent = child

		child.right = node
		child.parent = parent

		if parent
			parent.left == node ? parent.left = child : parent.right = child
		end
		@root = child if @root == node
	end

	def rotate_left(node)
		parent = node.parent
		child = node.right
		grandchild = node.right.left

		node.right = grandchild
		grandchild.parent = node if grandchild
		node.parent = child

		child.left = node
		child.parent = parent

		if parent
			parent.left == node ? parent.left = child : parent.right = child
		end
		@root = child if @root == node
	end

	def print_tree
		recursive_print([@root])
	end

	def recursive_print(node_array)
		return "Done printing" if node_array.all?{|node| node.nil?}
		child_nodes = []
		until node_array.empty?
			curr_node = node_array.shift

			if curr_node.nil?
				print "N "
				child_nodes.push(nil)
				child_nodes.push(nil)
			else
				child_nodes.push(curr_node.left)
				child_nodes.push(curr_node.right)
				print "#{curr_node.value} "
			end
			
		end
		puts ""
		recursive_print(child_nodes)
	end

end