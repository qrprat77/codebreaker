Feature: game generates random secret code

	In order to keep the codebreaker game interesting
	I want the game to generate a random secret code each time I play
	
	Scenario: 10,000 games
		Given 6 colors
		And 4 positions
		When I play 10,000 games
		Then each color should appear between 1500 and 1800 times in each position
		And each color should appear no more than once in each secret code
