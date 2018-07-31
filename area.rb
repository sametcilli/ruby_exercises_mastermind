class Area
    attr_accessor :colors
    def initialize 
        @colors = {'r' => ' Red ', 'g'=>' Green ', 'b' => ' Black ', 'o' => ' Orange', 'y' => 'Yellow ', 'p' => ' Pink'}
    end
    def display
        puts 'This is mastermind game'
        puts '___________________________________________________________'
        puts '|  ' + @colors.values().join(' | ') + '  |'
        puts '___________________________________________________________'
        puts '|   ' + @colors.keys().join('    |    ') + '   |'
        puts '___________________________________________________________'
    end
    def display_colors_row(colors)
        puts '|   ' + colors.join('    |    ') + '    |'
    end
    def display_guess_row(colors, guess)
        same = colors.select.with_index{|a, i| guess[i] == a }.length
        similar = colors.select{|a| guess.include?(a)}.length - same
        puts '|   ' + guess.join('    |    ') + '    |    ' + (" * " * same) + (" o " * similar) + (" . " * (guess.length - (similar+same)))
    end

end