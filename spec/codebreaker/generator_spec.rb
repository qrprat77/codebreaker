require File.join(File.dirname(__FILE__), "..","spec_helper")

module Codebreaker
	describe Generator do 
		it "generates a four-element array" do 
			generator = Generator.new
			generator.code.length.should == 4
		end
		it "only uses the game colors: r, y, g, c, b, and w" do
			generator = Generator.new
			generator.code.each do |color|
				%w[r y g c b w].should include(color)
			end
		end
		it "uses each color no more than once in each code" do 
			generator = Generator.new
			20.times do
				generator.code.uniq.length.should == 4

			end
		end
		it "generates a different code each time" do 
			generator = Generator.new
			codes = (1..100).collect {generator.code}
			codes.uniq.length.should be >= 75
		end
	end
end
