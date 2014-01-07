class Link
	attr_reader :value, :next

	def initialize(value)
		@value = value
		@next = nil
	end

	def set_next(link)
		@next = link
	end

end


class LinkedList
	attr_reader :first

	def initialize
		@first = nil
	end

	def append(value)
		new_link = Link.new(value)
		
		if @first.nil?
			@first = new_link 
		else
			last_link = @first	
			while !!last_link.next
				last_link = last_link.next
			end
			last_link.set_next(new_link)
		end
		
	end

	def remove(link)
		curr_link = @first
		until curr_link.next == link
			curr_link = curr_link.next
		end
		removed_link = curr_link.next
		curr_link.set_next(removed_link.next)
	end

end