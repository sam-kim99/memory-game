require_relative './card.rb'

class Board
    attr_reader :grid
    def self.print_grid(grid)
        grid.each {|row| puts row.join(" ")}
    end

    def initialize
        @grid = Array.new(5) {Array.new(5, "")}
        i = 0
        while i < 4
            @grid[0][i+1] = i
            @grid[i+1][0] = i
            i += 1
        end
    end

    # def flip

    # end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end



    def populate
        letter_bank = ["a", "b", "c", "d", "e", "f", "g", "h"]

        while letter_bank.length != 0
            position_1 = self.random_pos
            position_2 = self.random_pos

            if (self[position_1].empty? && self[position_2].empty?) && (position_1 != position_2)
                char = letter_bank.pop()
                card_1 = Card.new(char)
                card_2 = Card.new(char)
                # create_card_at(position_1, char)
                # create_card_at(position_2, char)
                self[position_1] = card_1.value
                self[position_2] = card_2.value
            end

        end
    end

    # def create_card_at(position,char)
    #     card = Card.new(char)
    #     self[position] = card.value
    # end

    def hidden_grid
        letter_bank = ["a", "b", "c", "d", "e", "f", "g", "h"]

        @grid.map do |row|
            row.map do |ele|
                if letter_bank.include?(ele)
                    ele = ""
                else
                    ele
                end
            end
        end
    end


    def render
        Board.print_grid(hidden_grid)
        
    end

    def random_pos
        rand_row = rand(1..4)
        rand_col = rand(1..4)

        position = [rand_row, rand_col]
        position
    end

    def empty?(position) 
        @grid[position] == ""
    end

    def reveal(guessed_pos)
        card = self[guessed_pos]
        if !card.face_up
            card.value
        end
    end

    def won?
        (1..4).each do |row_idx|
            (1..4).each do |col_idx|
                pos = [row_idx, col_idx]
                return false if self[pos].face_down
            end
        end
        true
    end

end
