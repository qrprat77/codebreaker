module Codebreaker
	class Stats
		attr_accessor :codes
		
		def initialize
			@counts = (1..4).collect { Hash.new {|h,k| h[k] = 0} }
			@codes = []
		end
		
		def puts(code)
			
			if code =~ /\w \w \w \w$/
				@code = code.split
				@code.each_with_index do |color, index|
					@counts[index][color] += 1
				end
				@codes << @code
			end
		end
		
		def count_for(color, position)
			@counts[position-1][color]
		end
		
	end
end
