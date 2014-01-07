class Link 

	attr_reader :previous, :next, :value

	def initialize(value)
		@value = value
		@previous = nil
		@next = nil
	end

	def set_prev(link)
		@previous = link
	end

	def set_next(link)
		@next = link
	end

end


class LinkedList
	attr_reader :name, :first, :last, :length

	def initialize(name)
		@name = name
		@first = nil
		@last = nil
		@length = 0
	end

	def append(value)
		new_link = Link.new(value)
		if @first.nil?
			@first = new_link
			@last = new_link
		else
			@last.set_next(new_link)
			new_link.set_prev(@last)

			@last = new_link
			new_link.set_next(@first)
			@first.set_prev(@last)
		end
		@length += 1
		new_link
	end

	def remove(link)
		curr_link = @first
		until curr_link == link
			curr_link = curr_link.next
		end
		if curr_link == @first
			@first = curr_link.next
		elsif curr_link == @last
			@last = curr_link.previous
		end

		prev_link = curr_link.previous
		next_link = curr_link.next

		prev_link.set_next(next_link)
		next_link.set_prev(prev_link)
		@length -= 1
	end

	def josephus_problem(k)
		curr_link = @first
		until self.length == 1
			(k-1).times do |i|
				curr_link = curr_link.next	
			end
			self.remove(curr_link)
		end
		@first
	end

end

def setup(n)
	linked_list = LinkedList.new("josephus")

	n.times do |i|
		linked_list.append(i)
	end

	linked_list
end