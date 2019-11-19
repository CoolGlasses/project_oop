class TicTacToe
    
    def initialize()
        @player1 = Player.new()
        @player2 = Player.new(@player1.symbol)
        @board = Board.new
        round()
    end

    def gameOver(board)
        
    end

    def result
    end

    def board
        
    end

    def victory
    end

    def round
        puts "#{@player1} it's your turn.  Choose a location to place your symbol: "
        player1_move = gets.chomp
        @board.move(player1_move, @player1.symbol)


    end


end

class Player

    def initialize(symbol = nil)
        puts "What is your name?"
        @name = gets.chomp
        if symbol == nil
            puts "Which symbol do you want, X or O?"
            @symbol = gets.chomp
        elsif symbol == "X"
            @symbol = "O"
        else
            @symbol = "X"
        end
    end

    def symbol
        @symbol
    end

    def name
        @name
    end
end

class Board
    def initialize
        @board = [[["1"],["2"],["3"]], [["4"],["5"],["6"]], [["7"],["8"],["9"]]]
    end

    def board
        @board
    end

    def move(player_move, symbol)

        case player_move
            when "1"
                @board[0][0] = symbol
            when "2"
                @board[0][1] = symbol
            when "3"
                @board[0][2] = symbol
            when "4"
                @board[1][0] = symbol
            when "5"
                @board[1][1] = symbol
            when "6"
                @board[1][2] = symbol
            when "7"
                @board[2][0] = symbol
            when "8"
                @board[2][1] = symbol
            when "9"
                @board[2][2] = symbol
            else
                return "Invalid move"
        end
        
        return @board
    end

    def print_board
        puts @board[0]
        puts @board[1]
        puts @board[2]
    end
    
end
