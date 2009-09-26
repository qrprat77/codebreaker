require File.join(File.dirname(__FILE__), "/../spec_helper")
require File.join(File.dirname(__FILE__), "/../../features/support/stats")

module Codebreaker
	describe "Stats" do 
		context "with 1 code with r in position 1" do 
			it "returns 1 for count_for('r', 1)"
			it "returns 0 for count_for('y', 1)"
		end #1 code 
		context "with 2 codes with r in position 1 twice and y in position 2 once" do 
			it "returns 2 for count_for('r', 1)"
			it "returns 0 for count_for('y', 1)"
			it "returns 1 for count_for('y', 2)"
		end
	end
end
