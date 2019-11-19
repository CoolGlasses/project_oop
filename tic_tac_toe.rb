class TicTacToe
    
    def initialize()
        @player1 = Player.new(1)
        @player2 = Player.new(2, @player1.symbol)
        @board = Board.new
        play()
    end

    def gameOver(player, tie = false)
        if tie == true
            board()
            puts
            puts "Gameover!  No more available moves, this game ends in a tie!"
        else
            board()
            puts
            puts "#{player.name} wins!  Gameover!"
        end

        puts "New game(Y/N)?"
        start = gets.chomp.upcase

        if start == "Y"
            TicTacToe.new()
        end
    end

    def board
        @board.print_board
    end

    def victory
        unpicked = "123456789"
        board = @board.board
        row_one = board[0].join
        row_two = board[1].join
        row_three = board[2].join
        column_one = board[0][0] + board[1][0] + board[2][0]
        column_two = board[0][1] + board[1][1] + board[2][1]
        column_three = board[0][2] + board[1][2] + board[2][2]
        diagonal_one = board[0][0] + board[1][1] + board[2][2]
        diagonal_two = board[0][2] + board[1][1] + board[2][0]

        x_wins = "XXX"
        o_wins = "OOO"

        conditions = []
        conditions << row_one
        conditions << row_two
        conditions << row_three
        conditions << column_three
        conditions << column_two
        conditions << column_one
        conditions << diagonal_one
        conditions << diagonal_two

        conditions.each do |condition|
            if condition == x_wins
                return "X"
            elsif condition == o_wins
                return "O"
            end
        end

        tie = true

        conditions.each do |condition|
            condition.each_char do |char|
                if unpicked.include?(char)
                    tie = false
                end
            end
        end

        if tie == true
            return "tie"
        else
            return false
        end
    end

    def play

        whose_turn = @player1
        rounds = 1
        
        while !victory()
        
            board()
            puts
            puts "#{whose_turn.name} it's your turn.  Choose a location to place your symbol: "
            move = gets.chomp

                while !@board.move(move, whose_turn.symbol)
                    puts
                    puts "Invalid Move!  Please try again!"
                    puts
                    puts "Choose a location to place your symbol: "
                    move = gets.chomp
                end
        
            @board.move(move, whose_turn.symbol)

            if whose_turn == @player1
                whose_turn = @player2
            else
                whose_turn = @player1
            end

            rounds += 1
        end

        if victory() == @player1.symbol
            gameOver(@player1)
        elsif victory() == @player2.symbol
            gameOver(@player2)
        elsif victory() == "tie"
            tie = true
            gameOver(@player1, tie)
        end

    end


end

class Player

    def initialize(number, symbol = nil)
        @player_number = number
        puts
        puts "Player #{number}, what is your name?"
        @name = gets.chomp

        if symbol == nil
            puts
            puts "Which symbol do you want, X or O?"
            @symbol = gets.chomp

                error_free = false

                while !error_free
                    if @symbol != "X" && @symbol != "O"
                        puts
                        puts "Invalid Symbol!  Please pick again!"
                        puts
                        puts "Which symbol do you want, X or O?"
                        @symbol = gets.chomp
                    else
                        error_free = true
                    end
                end

        elsif symbol == "X"
            @symbol = "O"
            puts
            puts "Player #{@name}, your symbol is #{@symbol} !"
        else
            @symbol = "X"
            puts
            puts "Player #{@name}, your symbol is #{@symbol} !"
        end
    end

    def symbol
        @symbol
    end

    def name
        @name
    end

    def number
        @player_number
    end
end

class Board
    def initialize
        @board = [
                  ["1", "2", "3"], 
                  ["4", "5", "6"], 
                  ["7", "8", "9"]
                ]
    end

    def board
        @board
    end

    def move(player_move, symbol)

        case player_move
            when "1"
                if @board[0][0] != "1"
                    return false
                else
                    @board[0][0] = symbol
                end
            when "2"
                if @board[0][1] != "2"
                    return false
                else
                    @board[0][1] = symbol
                end
            when "3"
                if @board[0][2] != "3"
                    return false
                else
                    @board[0][2] = symbol
                end
            when "4"
                if @board[1][0] != "4"
                    return false
                else
                    @board[1][0] = symbol
                end
            when "5"
                if @board[1][1] != "5"
                    return false
                else
                    @board[1][1] = symbol
                end
            when "6"
                if @board[1][2] != "6"
                    return false
                else
                    @board[1][2] = symbol
                end
            when "7"
                if @board[2][0] != "7"
                    return false
                else
                    @board[2][0] = symbol
                end
            when "8"
                if @board[2][1] != "8"
                    return false
                else
                    @board[2][1] = symbol
                end
            when "9"
                if @board[2][2] != "9"
                    return false
                else
                    @board[2][2] = symbol
                end
            else
                return false
        end
        
        return @board
    end

    def print_board
        puts
        print @board[0]
        puts
        print @board[1]
        puts
        print @board[2]
        puts
        puts "------"
    end
    
end


##This starts the game when the file is run initially
TicTacToe.new()
