require_relative 'Board'
require_relative 'Player'

class GameManager
	
	def initialize		
		@player1 = Player.new("X")
		@player2 = Player.new("Z")
		@playingBoard = Board.new
		letsPlay
	end


	def letsPlay
		#Player one goes on odd numbers
		#Player two goes on even numbers		
		i = Random.new.rand(2)
		puts i
		displayBoard
		
		loop do 
			if(i % 2 == 0)
				makePlayerMove(@player2)
				if isWon?
					puts "Congratulations #{@player2.name.capitalize}"
					break
				end
			else
				makePlayerMove(@player1)				
				if isWon?
					puts "Congratulations #{@player1.name.capitalize}"
					break
				end
			end			
			i += 1 #increment this so players change			
		end

	end

	def makePlayerMove(player)		

		puts "Please go #{player.name}! Choose a number on the board!"
		
		input = validInput(gets.chomp)

		registerMove(input, player) #make the move

		@playingBoard.convertArrayIntoBoard #now the move is register convert it into formatted string

		displayBoard #display the board

	end

	def validInput(input)
		input = input.to_s
		valid = false
		possibleValidInput = "123456789"

		loop do  
			if possibleValidInput.include?(input) #if it is a number 0-9
				if @playingBoard.board.each_char.any? {|x| x == input} #if the board has that number
					valid = true										
				else
					puts "Sorry that move is taken! Try Again!"
					input = gets.chomp					
				end
			else #if the user doesnt enter between 1 through 9
				puts "Please enter a digit 1 through 9!"
				input = gets.chomp
			end

			break if valid == true
		end

		return input.to_i
	end

	def isWon?
		#there are 8 cases where the user can win
		gameIsWon = false
		
		#vertical rows
		gameIsWon = true if(@playingBoard.boardArray[0][0] == @playingBoard.boardArray[0][1] && @playingBoard.boardArray[0][1] == @playingBoard.boardArray[0][2])
		gameIsWon = true if(@playingBoard.boardArray[1][0] == @playingBoard.boardArray[1][1] && @playingBoard.boardArray[1][1] == @playingBoard.boardArray[1][2])
		gameIsWon = true  if(@playingBoard.boardArray[2][0] == @playingBoard.boardArray[2][1] && @playingBoard.boardArray[2][1] == @playingBoard.boardArray[2][2])
		
		#horizontal rows
		gameIsWon = true if(@playingBoard.boardArray[0][0] == @playingBoard.boardArray[1][0] && @playingBoard.boardArray[1][0] == @playingBoard.boardArray[2][0])
		gameIsWon = true if(@playingBoard.boardArray[0][1] == @playingBoard.boardArray[1][1] && @playingBoard.boardArray[1][1] == @playingBoard.boardArray[2][1])
		gameIsWon = true if(@playingBoard.boardArray[0][2] == @playingBoard.boardArray[1][2] && @playingBoard.boardArray[1][2] == @playingBoard.boardArray[2][2])
		
		#cross rows
		gameIsWon = true if(@playingBoard.boardArray[0][0] == @playingBoard.boardArray[1][1] && @playingBoard.boardArray[2][2] == @playingBoard.boardArray[0][2])
		gameIsWon = true if(@playingBoard.boardArray[0][2] == @playingBoard.boardArray[1][1] && @playingBoard.boardArray[2][0] == @playingBoard.boardArray[0][2])

		gameIsWon
	end

	def registerMove(input, player)
		case input
		when 1
			puts "#{player} , you picked move #{input}"
			@playingBoard.boardArray[0][0] = player.mark
		when 2
			puts "#{player} , you picked move #{input}"
			@playingBoard.boardArray[0][1] = player.mark
		when 3
			puts "#{player} , you picked move #{input}"
			@playingBoard.boardArray[0][2] = player.mark
		when 4
			puts "#{player} , you picked move #{input}"
			@playingBoard.boardArray[1][0] = player.mark
		when 5
			puts "#{player} , you picked move #{input}"
			@playingBoard.boardArray[1][1] = player.mark
		when 6
			puts "#{player} , you picked move #{input}"
			@playingBoard.boardArray[1][2] = player.mark
		when 7
			puts "#{player} , you picked move #{input}"
			@playingBoard.boardArray[2][0] = player.mark
		when 8
			puts "#{player} , you picked move #{input}"
			@playingBoard.boardArray[2][1] = player.mark	
		when 9
			puts "#{player} , you picked move #{input}"
			@playingBoard.boardArray[2][2] = player.mark
		end
	end



	def displayBoard
		puts @playingBoard.board
	end

end


newGame = GameManager.new