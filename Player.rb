class Player
	attr_accessor :name, :mark
	def initialize(mark)
		puts "HELLO! What is your name?"
		@name = gets.chomp
		@mark = mark
		puts "Your name is #{@name}! Welcome!"
	end
end