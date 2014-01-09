require 'debugger'

class Heap

	def initialize(&comparator)
		@values = []
		@comparator = comparator
	end

	#insert into next available space
	# 1. check sibling if both left & right are occupied, then move on
	# 2. keep track of "next" space to insert into
	# 3. use an array(lol)

	def << (value)
		@values << value
		heap_up 
	end

	#finding parent of a value, value.place/2 if odd, value.place/2 -1 if even
	def heap_up
		sorted = false
		child_position = @values.length - 1
		
		until sorted || child_position == 0
			sorted = true
			parent_position = child_position.odd? ? child_position/2 : child_position/2 -1

			if @comparator.call(@values[parent_position], @values[child_position]) == -1 
				sorted = false
				@values[parent_position], @values[child_position] = @values[child_position], @values[parent_position]
				child_position = parent_position
			end
		end
	end

	def remove
		@values[0] = @values[@values.length - 1]
		@values = @values[0..@values.length - 2]
		heap_down
	end

	def heap_down
		if @comparator.call(@values[0], @values[1]) == -1
			@values[0], @values[1] = @values[1], @values[0]
			heap_down
		elsif @comparator.call(@values[0], @values[2]) == -1
			@values[0], @values[2] = @values[2], @values[0]
			heap_down
		end
	end

	def read
	 p @values
	end

end


class MaxHeap < Heap

	def initialize
		super{|x, y| x <=> y}
	end

end

class MinHeap < Heap

	def initialize
		super{|x, y| y <=> x}
	end

end