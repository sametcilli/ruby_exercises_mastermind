class Game 
    require_relative './area'
    def initialize
        @area = Area.new
    end
    def play 
        @area.display
        puts "1 : multiplayer"
        puts "2 : single"
        answer = ''
        until answer == '1' || answer == '2'
            answer = gets.chomp.to_str
        end
        if answer == 1
            puts 'select color for guess with space seperate'
            get_colors
        else 
            @colors = @area.colors.to_a.sample(4).to_h
        end
        get_guess_ok        
        system 'cls' or system 'clear'
        @area.display
        puts '/ there are right letter and right place'
        puts 'o there are right letter but wrong place'
        puts 'select color for guess with space seperate'
        @guess = []
        @is_success = 0
        until @guess.length == 12 || @is_success == 1
            get_guess
        end
        if @is_success == 1
            puts "Congratulations, You won!"
        else
            puts "Sorry, You failed!"
            puts "Your friend selected followed colors :"
            @area.display_colors_row(@colors)
        end
    end
    def get_guess
        guess = []
        selected = 0
        until selected == 1
            color_entered = gets.chomp.to_str
            guess = color_entered.split.to_a
            if(guess.length == 4 && guess.all?{|c| @area.colors.include?(c)} && guess.all?{|a| a.length == 1})
                @guess.push(guess)
                @area.display_guess_row(@colors, guess)
                selected = 1
                if(guess == @colors)
                    @is_success = 1
                end
            end
        end
        
    end
    def get_guess_ok
        puts "Now, It is guess time. Are you OK? press y or Y"
        answer = ''
        until answer == 'y' || answer == 'Y'
            answer = gets.chomp.to_str
        end
    end
    def get_colors
        @colors = []
        until @colors.length == 4 && @colors.all?{|c| @area.colors.include?(c)}
            color_entered = gets.chomp.to_str
            @colors = color_entered.split.to_a
        end
        p @colors
    end
end