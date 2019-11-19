class Mastermind
    def initialize
        @player = Player.new()
        @board = Board.new()
        play()
    end

    def board
        @board.print_board 
    end

    def feedback
    end
    
    def gameOver(guess, secret_code, tries_left = 1)
        if guess == secret_code
            puts "You WIN!  You're a Mastermind!"
        elsif tries_left == 0
            puts "Gameover!  You lose!"
        else
            false
        end
    end

    def play 
        tries_left = 12
        puts "I have my secret code!"
        

        while tries_left > 0
            puts  @board.print_board
            puts "You have #{tries_left} guesses.  Whats my code?"
            puts
            
            if !gameOver(@player.guess(), @board.board, tries_left)
                puts "That isn't exactly correct!"
                puts @board.print_board
            else
                gameOver(@player.guess(), @board.board, tries_left)
            end
            
            tries_left -=1
        end    
    end
end



class Player
    def initialize
        puts
        puts "Hello Player, what is your name?"
        @name = gets.chomp
    end

    def name
        @name
    end

    def guess
        @guess = ["color1", "color2", "color3", "color4"]
        puts guess
        puts
        puts "Color1: "
        @guess[0] = gets.chomp
        puts
        puts "color2: "
        @guess[1] = gets.chomp
        puts
        puts "color3: "
        @guess[2] = gets.chomp
        puts
        puts "color4: "
        @guess[3] = gets.chomp
        
        return @guess
    end

end

class Board
    def initialize
        @potential_colors = ["Red", "Blue", "Green", "Yellow", "Purple", "Orange"]
        @board = generate_secret_code()
        #@feedback = 
    end

    def generate_secret_code
        @color1 = @potential_colors.sample
        @color2 = @potential_colors.sample
        @color3 = @potential_colors.sample
        @color4 = @potential_colors.sample
        return [ @color1, @color2, @color3, @color4 ]
    end

    def print_board
        print "The potential colors are #{@potential_colors}"
        print @board
        #puts @feedback
    end

    def board
        @board
    end


end

Mastermind.new()