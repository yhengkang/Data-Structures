require 'benchmark'

def iterative_prime(max)
	num = 2
	primes_array = []
	while num < max
		if is_prime?(num)
			primes_array << num
		end
		num += 1
	end
	primes_array
end

def is_prime?(num)
	i = 2
	while i < num
		if num % i == 0
			return false
		end
		i += 1
	end
	return true
end

def prime_sieve(max)
	primes_hash = Hash.new(true)
	num = 2
	primes_array = []
	while num < max
		if primes_hash[num]
			primes_array << num
			i = 2
			while num*i < max
				primes_hash[num*i] = false
				i += 1
			end
		end 
		num += 1
	end	
	primes_array
end

def display_difference(max)
	time_sieve(max)
	time_iterative(max)
end

def time_iterative(max)
	puts "max = #{max}"
	start = Time.now
	iterative_prime(max)
	finish = Time.now
	puts "iterative #{finish-start}"
end

def time_sieve(max)
	start = Time.now
	prime_sieve(max)
	finish = Time.now
	puts "sieve #{finish-start}"
end
