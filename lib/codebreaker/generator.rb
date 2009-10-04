module Codebreaker
	class Generator
		def code
			colors = %w[r y g c b w]
			(1..4).collect do
				 colors.delete_at(rand(colors.length))
			end
		end
	end
end
