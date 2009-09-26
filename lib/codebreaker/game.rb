module Codebreaker
	class Game
		def initialize(messenger)
			@messenger = messenger			
		end
		
		def start(generator)
			@code = generator.code
			@messenger.puts "Welcome to Codebreaker!"
			@messenger.puts "Enter guess:"
		end
		
		def guess(guess)
			result= [nil, nil, nil, nil]
			
			while(guess.length != 4)
			guess = forced_array(guess)
			end
			guess.each_with_index do |peg, index|
				if peg == 0
					result << "Error improper input"
					break
				end
				if @code[index] == peg
					result[index] = "b"
				elsif @code.include?(peg)
					result[@code.index(peg)] ||= "w"
				end
			end
			@messenger.puts result.compact.sort.join
		end
		
		def forced_array(g)
			if g.length == 1
				return g[0].scan(/./)
			else
				empty = [0, 0, 0, 0]
				return empty
			end
		end
	end
end
