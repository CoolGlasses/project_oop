require "byebug"

class Mastermind
    def initialize
        @player = Player.new()
        @board = Board.new()
        puts "#{@player.name}, do you want to guess my code or would you like me(Hal) to guess yours?  1: #{@player.name} sets the code, 2: Hal(the all knowning computer) will set the code."
        @users_role = gets.chomp
            #should probably add some error checking to this input retrieval
        play(@users_role.to_i)
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

        if @users_role == 1
            puts
            puts "I got #{colors_correct} of the correct Colors."
            puts
            puts "AND"
            puts
            puts "I got #{positions_correct} of those colors in the correct Position."
            puts
        else
            puts
            puts "You got #{colors_correct} of the correct Colors."
            puts
            puts "AND"
            puts
            puts "You got #{positions_correct} of those colors in the correct Position."
            puts
        end
        return [colors_correct, positions_correct]
    end
    
    def gameOver(guess, secret_code, tries_left = 1)
        if guess == secret_code
            puts "You WIN #{@player.name}!  You're a Mastermind!"
        elsif tries_left == 0
            if @users_role == 1
                puts
                puts "Gameover!  You lose #{@player.name}!"
                puts
                feedback(guess, secret_code)
                puts
                puts "My Secret Code was: #{@board.board}"
            else
                puts
                puts "Gameover!  I lost!!"
                puts
            end
        else
            false
        end
    end

    def play(users_role)
        if users_role == 1
            @player.set_secret_code

            @computer = ComputerPlayer.new("Hal")

            tries_left = 12
            puts
            puts "Hal: Hmm... I wonder what your secret code is..."
        

            while tries_left > 0

                puts
                puts "I have #{tries_left} guesses remaining.  Dag-nabbit... whats the code?!?"
                puts

                tries_left -=1
                guess = @computer.guess

                puts "Hal: I think it's #{guess}!"
            
                if gameOver(guess, @player.player_secret_code, tries_left) == false
                    puts
                    puts "Hal: Ugh!  I was wrong!"
                    feedback(guess, @player.player_secret_code)
                    puts
                end  
            end


        else ##player is guessing

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
                    puts "That is incorrect!"
                    feedback(guess, @board.board)
                    puts
                end  
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

    def set_secret_code
        puts "Not Hal: Okay #{@name}, what do you want your secret code to be?"
        
        @player_secret_code = ["color1", "color2", "color3", "color4"]
        puts
        puts "Color1: "
        @player_secret_code[0] = gets.chomp
        @player_secret_code[0].capitalize!
        puts
        puts "color2: "
        @player_secret_code[1] = gets.chomp
        @player_secret_code[1].capitalize!
        puts
        puts "color3: "
        @player_secret_code[2] = gets.chomp
        @player_secret_code[2].capitalize!
        puts
        puts "color4: "
        @player_secret_code[3] = gets.chomp
        @player_secret_code[3].capitalize!

        puts
        puts "Not Hal: Okay #{@name}, you have set your secret code to: #{@player_secret_code}.  Let's see if Hal can figure it out!"
        puts

        return @player_secret_code
    end

    def player_secret_code
        @player_secret_code
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

    def board=(array)
        @board = array
    end
end


class ComputerPlayer
    def initialize(name)
        @name = name
        @history = Hash.new(0)
    end

    def guess
        #Array arrives with [ Colors Correct, Positions Correct] data
        @potential_colors = ["Red", "Blue", "Green", "Yellow", "Purple", "Orange"]
        @color1 = @potential_colors.sample
        @color2 = @potential_colors.sample
        @color3 = @potential_colors.sample
        @color4 = @potential_colors.sample
        @guess = [ @color1, @color2, @color3, @color4 ]
        return @guess
    end

    def game_history(guess, feedback_array)
        @history[guess] = feedback_array
        return @history
    end        
end

Mastermind.new()