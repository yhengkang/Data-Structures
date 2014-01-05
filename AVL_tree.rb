class AVLNode
	attr_accessor :value, :left, :right, :parent

	def initialize(value)
		@parent = nil
		@left = nil
		@right = nil
		@value = value
	end

	def get_depth
		depth = 1
		curr_node = self
		until curr_node.left.nil? && curr_node.right.nil?
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

	#balance only accounts for RR or LL cases, not RL or LR cases 

	def recursive_balance(node)
		return "Done balancing" if node.nil?

		if node.get_balance_factor > 1
			rotate_right(node)
		elsif node.get_balance_factor < -1
			rotate_left(node)
		end
		recursive_balance(node.parent)
	end

	def rotate_right(node)
		original_parent = node.parent
		left_node = node.left

		left_node.parent = original_parent
		left_node.right = node

		node.left = nil
		node.parent = left_node

		if node == @root
			@root = left_node
		end
	end

	def rotate_left(node)
		original_parent = node.parent
		right_node = node.right

		right_node.parent = original_parent
		right_node.left = node
		
		node.right = nil
		node.parent = right_node

		if node == @root
			@root = right_node
		end
	end

	def print_tree
		recursive_print([@root])
	end

	def recursive_print(node_array)
		return "Done printing" if node_array.empty? || node_array.all?{|node| node.nil?}
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