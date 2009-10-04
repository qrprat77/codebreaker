require File.join(File.dirname(__FILE__), "..","spec_helper")
require File.join(File.dirname(__FILE__), "..","..","features","support","stats")

module Codebreaker
	describe Stats do 
		context "with 1 code with r in position 1" do 
			before(:each) do
				@stats = Stats.new
				@stats.puts("r y g b")
			end
			it "returns 1 for count_for('r',1)" do
				@stats.count_for('r',1).should == 1
			end
			it "returns 0 for count_for('y',1)" do
				@stats.count_for('y',1).should == 0
			end
		end #1 code 
		context "with 2 codes with r in position 1 twice and y in position 2 once" do 
			before(:each) do
				@stats = Stats.new
				@stats.puts("r y g b")
				@stats.puts("r g y b")
			end
			it "returns 2 for count_for('r',1)" do
				@stats.count_for('r',1).should == 2
			end
			it "returns 0 for count_for('y',1)" do
				@stats.count_for('y',1).should == 0
			end
			it "returns 1 for count_for('y',2)" do
				@stats.count_for('y',2).should == 1
			end
		end
	end
	describe "#codes" do 
		before(:each) do
			@stats = Stats.new
		end
		context "with no codes" do 
			it "returns an empty array" do 
				@stats.codes.should == []
			end
		end
		context "with one code" do
			it "returns an array with that code in it (as an array of colors)" do
				@stats.puts "r y g c"
				@stats.codes.should == [%w[r y g c]] 
			end
		end
		context "with several codes and other messages" do 
			it "returns an array with all the codes" do 
				@stats.puts "r y g c"
				@stats.puts "an arbitrary message"
				@stats.puts "b w y r"
				@stats.puts "another arbitrary message"
				@stats.puts "g w b c"
				@stats.puts "Chunky Bacon"
				@stats.codes.should == [
				  %w[r y g c],
				  %w[b w y r],
				  %w[g w b c]
				]
			end
		end
	end
end
