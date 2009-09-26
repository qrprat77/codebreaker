require File.join(File.dirname(__FILE__), "/../spec_helper")

module Codebreaker
	describe Game do
		before(:each) do
			@messenger = mock("messenger").as_null_object
			@game = Game.new(@messenger)
		end
		
		context "starting up" do
			it "should send a welcome message" do
				@messenger.should_receive(:puts).with("Welcome to Codebreaker!")
				@game.start(stub('generator', :code => %w[r g y c]))
			end
			
			it "should prompt for the first guess" do
				@messenger.should_receive(:puts).with("Enter guess:")
				@game.start(stub('generator', :code => %w[r g y c]))
			end
		end #starting up context
		context "marking a guess" do
			context "with all 4 colors correct in the correct places" do
				it "should mark the guess with bbbb" do 
					@game.start(stub('generator', :code => %w[r g y c]))
					@messenger.should_receive(:puts).with("bbbb")
					@game.guess(%w[r g y c])
				end
			end # 4 correct, 4 right spot
			context "with all 4 colors correct and 2 in the correct places" do
				it "should mark the guess with bbww" do 
					@game.start(stub('generator', :code => %w[r g y c]))
					@messenger.should_receive(:puts).with("bbww")
					@game.guess(%w[r g c y])
				end
			end # 4 correct, 2 right spot
			context "with all 4 colors correct and 1 in the correct place" do
				it "should mark the guess with bwww" do 
					@game.start(stub('generator', :code => %w[r g y c]))
					@messenger.should_receive(:puts).with("bwww")
					@game.guess(%w[y r g c])
				end
			end # 4 correct 1 right spot
			context "with no spaces in the guess code" do
			   it "should mark the guess with bbbb" do 
				   @game.start(stub('generator', :code => %w[r g y c]))
				   @messenger.should_receive(:puts).with("bbbb")
				   @game.guess(%w[rgyc])
			   end
			end #no spaces
		end #marking guess context
		context "with duplicates in the guess that match a peg in the code" do
			context "with three colors correct in the correct places" do
				it "should mark the guess with bbb" do 
					@game.start(stub('generator', :code => %w[r g y c]))
					@messenger.should_receive(:puts).with("bbb")
					@game.guess(%w[r g y w])
				end
			end
			context "by color and position" do
				it "should add a single b to the mark" do 
					@game.start(stub('generator', :code => %w[r y g c]))
					@messenger.should_receive(:puts).with("bbb")
					@game.guess(%w[r y g g])
				end
			end #by color and position context
		end #dups that match context
	end
end
