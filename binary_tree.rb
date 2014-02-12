class Node
	attr_accessor :key, :left, :right

	def initialize(key, left, right)
		@key = key
		@left = left
		@right = right
	end

end


class BinaryTree
	attr_reader :root

	def initialize
		@root = Node.new(nil, nil, nil)
	end

	def search(key)
		recursive_search(@root, key)
	end

	def recursive_search(node, key)
		return false if node.key.nil?
		return node if node.key == key
		if node.key > key
			recursive_search(node.left, key)
		else
			recursive_search(node.right, key)
		end
	end

	def insert(key)
		curr_node = @root
		while !!curr_node.key
			if curr_node.key > key
				curr_node = curr_node.left
			else
				curr_node = curr_node.right
			end
		end
		curr_node.key = key
		curr_node.left, curr_node.right = Node.new(nil, nil, nil), Node.new(nil, nil, nil)
	end

	def print
		nodes = [@root]
		until nodes.empty?
			curr_node = nodes.shift
			nodes << curr_node.left unless curr_node.left.key.nil?
			nodes << curr_node.right unless curr_node.right.key.nil?
			puts "node: #{curr_node.key}"
		end
	end

	# Given a node in a Binary Search Tree, find the node with the next largest value. 
	# Assume you don't have the root of the tree, just a single node from it.

	def next_largest(node)


	end

end