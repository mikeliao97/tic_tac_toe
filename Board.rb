#The board for tic Tac tEo
class Board
	attr_accessor :board, :boardArray
	def initialize	
		@boardArray = Array.new(3) { Array.new(3, 0) }	
		initializeArray #initialize the Array
		convertArrayIntoBoard #put the array into a formatted string		
	end
	def returnBoard
		@board
	end

	def initializeArray
		count = 1
		for i in 0..2
			for j in 0..2
				@boardArray[i][j] = count
				count += 1
			end
		end
	end

	def convertArrayIntoBoard
		@board = "| #{@boardArray[0][0]} | #{@boardArray[0][1]} | #{@boardArray[0][2]} |\n| #{@boardArray[1][0]} | #{@boardArray[1][1]} | #{@boardArray[1][2]} | \n| #{@boardArray[2][0]} | #{@boardArray[2][1]} | #{@boardArray[2][2]} | "
	end

end