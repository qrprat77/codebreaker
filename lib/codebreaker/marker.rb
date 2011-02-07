class Marker
      def initialize(secret, guess)
	    @secret ,@guess = secret, guess
      end #initialize
      
      def exact_match_count
	      (0..3).inject(0) do |count, index|
		      count + (exact_match?(index) ? 1 : 0)
	      end
      end

      def number_match_count
	      number_match_count = 0
	      (0..3).inject(0) do |count, index|
		      count +  (number_match?(index) ? 1 : 0)
	      end #iteration over index
      end

      def exact_match?(index)
		@guess[index] == @secret[index]
      end #exact_match?
      
      def number_match?(index)
		@secret.include?(@guess[index]) && !exact_match?(index)
      end #number_match?
	
  
  
end #Marker
