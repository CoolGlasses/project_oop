require "byebug"

class Mastermind
    def initialize
        @player = Player.new()
        @board = Board.new()
        play()
    end

    def board
        @board.print_board 
    end

    def feedback(guess, secret_code)
        colors_correct = 0
        positions_correct = 0

        guess.each_with_index do |color, i|
            if secret_code[i] == color
                colors_correct += 1
                positions_correct += 1
            elsif secret_code.include?(color)
                colors_correct += 1
            end
        end

            puts
            puts "You got #{colors_correct} of the correct Colors."
            puts
            puts "AND"
            puts
            puts "You got #{positions_correct} of those colors in the correct Position."
            puts
        return [colors_correct, positions_correct]
    end
    
    def gameOver(guess, secret_code, tries_left = 1)
        if guess == secret_code
            puts "You WIN #{@player.name}!  You're a Mastermind!"
        elsif tries_left == 0
            puts
            puts "Gameover!  You lose #{@player.name}!"
            puts
            feedback(guess, secret_code)
            puts
            puts "My Secret Code was: #{@board.board}"
        else
            false
        end
    end

    def play 
        tries_left = 12
        puts
        puts "I have my secret code! Think you can guess what it is?"
        

        while tries_left > 0

            puts
            puts @board.print_potential_colors
            puts
            puts "You have #{tries_left} guesses remaining.  Whats my code?"
            puts
            puts @board.hidden_board
            puts

            tries_left -=1
            guess = @player.guess()
            
            if gameOver(guess, @board.board, tries_left) == false
                puts
                puts "That isn't exactly correct!"
                feedback(guess, @board.board)
                puts
            end  
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
        puts
        puts "Color1: "
        @guess[0] = gets.chomp
        @guess[0].capitalize!
        puts
        puts "color2: "
        @guess[1] = gets.chomp
        @guess[1].capitalize!
        puts
        puts "color3: "
        @guess[2] = gets.chomp
        @guess[2].capitalize!
        puts
        puts "color4: "
        @guess[3] = gets.chomp
        @guess[3].capitalize!
        
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

    def hidden_board
        @hidden_board = [ "color1", "color2", "color3", "color4" ]
        print @hidden_board
    end
end


class ComputerPlayer
    def initialize
        @history = Hash.new(0)
    end

    def guess(feedback_array=nil)
        #Array arrives with [ Colors Correct, Positions Correct] data
        @potential_colors = ["Red", "Blue", "Green", "Yellow", "Purple", "Orange"]

        if feedback_array == nil
            @color1 = "Red"
            @color2 = "Blue"
            @color3 = "Green"
            @color4 = "Yellow"
            @guess = [ @color1, @color2, @color3, @color4 ]
        else
            case feedback_array[0]
                when 1
                when 2
                when 3
                when 4
                else
            end

            case feedback_array[1]
                when 1
                when 2
                when 3
                else
            end
        
        end

        #need to pass guess to gameOver?
    end

    def game_history(guess, feedback_array)
        @history[guess] = feedback_array
        return @history
    end    





        return @guess
    end
end

Mastermind.new()