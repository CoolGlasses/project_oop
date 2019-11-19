class Mastermind
    def initialize
        @player = Player.new()
        @board = Board.new()
        play()
    end

    def board
        @board.print_board 
    end

    def feedback(guess, secret_code, tries_left = 12)
        colors_correct = 0
        positions_correct = 0

        guess.each_with_index do |color, i|
            if secret_code[i] = color
                colors_correct += 1
                positions_correct += 1
            elsif secret_code.include?(color)
                colors_correct += 1
            end
        end
        
        if tries_left == 12
            puts "You have no Feedback yet!"
        else
            puts "You got #{colors_correct} of the correct Colors!"
            puts "AND"
            puts "You got #{positions_correct} of those colors in the correct Position!"
        end
    end
    
    def gameOver(guess, secret_code, tries_left = 1)
        if guess == secret_code
            puts "You WIN!  You're a Mastermind!"
        elsif tries_left == 0
            puts "Gameover!  You lose!"
            feedback(guess, secret_code)
            puts
            puts "BUT! My Secret Code was: #{@board.board}"
        else
            false
        end
    end

    def play 
        tries_left = 12
        puts "I have my secret code! Think you can guess what it is?"
        

        while tries_left > 0
            puts @board.print_potential_colors
            puts
            puts "You have #{tries_left} guesses remaining.  Whats my code?"
            puts
            
            if !gameOver(@player.guess, @board.board, tries_left)
                puts "That isn't exactly correct!"
                feedback(@player.guess, @board.board, tries_left)
            else
                gameOver(@player.guess, @board.board, tries_left)
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
        generate_secret_code()
    end

    def generate_secret_code
        @color1 = @potential_colors.sample
        @color2 = @potential_colors.sample
        @color3 = @potential_colors.sample
        @color4 = @potential_colors.sample
        @board = [ @color1, @color2, @color3, @color4 ]
    end

    def print_potential_colors
        print "The potential colors are #{@potential_colors}"
    end

    def board
        @board
    end


end

Mastermind.new()