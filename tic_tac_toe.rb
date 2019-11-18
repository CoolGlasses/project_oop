class TicTacToe
    
    def initialize()
        @player1 = Player.new()
        @player2 = Player.new()
        board()
        move()
    end

    def gameOver(board, player1_positions, player2_positions)
    end

    def result
    end

    def board
        @board = [[["*"],["*"],["*"]], [["*"],["*"],["*"]], [["*"],["*"],["*"]]]
    end

    def move
    end

    def victory
    end

end

class Player

    def initialize
        puts "What is your name?"
        @name = gets.chomp
        puts "Which symbol do you want, X or O?"
        @symbol = gets.chomp
    end

    def symbol
        @symbol
    end

    def name
        @name
    end
end