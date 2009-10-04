def messenger
	@messenger ||= StringIO.new
end

def game
	@game ||= Codebreaker::Game.new(messenger)
end

def messages_should_include(message)
	messenger.string.split("\n").should include(message)
end

def fixnum_from(string)
	string.scan(/\d/).join.to_i
end


Given /^I am not yet playing$/ do
end

Given /^the secret code is (. . . .)$/ do |code|
	game.start(stub('generator', :code => code.split))
end

Given /^6 colors$/ do

end

Given /^4 positions$/ do

end

When /^I start a new game$/ do
    game.start(stub('generator', :code => %w[r g y c]))
end

When /^I guess (. . . .)$/ do |code|
	game.guess(code.split)
end

When /^I play (.*) games$/ do |number|
	generator = Codebreaker::Generator.new
	@stats = Codebreaker::Stats.new
	game = Codebreaker::Game.new(@stats)
	fixnum_from(number).times do
		game.start(generator)
		game.guess(["reveal"])
	end
end

Then /^the game should say "([^\"]*)"$/ do |message|
	messages_should_include(message)
end

Then /^the mark should be (.*)$/ do |mark|
	messages_should_include(mark)
end

Then /^each color should appear between (\d+) and (\d+) times in each position$/ do
	|min, max|
	%w[r y g c b w].each do |color|
		(1..4).each do |position|
			count = @stats.count_for(color,position)
			count.should be_between(min.to_i, max.to_i),
			  "expected #{count} to be between #{min} and #{max}"
		end
	end
end

Then /^each color should appear no more than once in each secret code$/ do
  @stats.codes.each do |code|
	  code.uniq.length.should ==4 
  end
end
