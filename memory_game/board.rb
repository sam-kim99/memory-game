class Board
    def initialize
        @grid = Array.new(5) {Array.new(5, "")}
        i = 0
        while i < 4
            @grid[0][i+1] = i
            @grid[i+1][0] = i
            i += 1
        end
    end

    def flip

    end

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

            if self[position_1].empty? && self[position_2].empty?
                char = letter_bank.pop()
                card_1 = Card.new(char)
                card_2 = Card.new(char)
                self[position_1] = card_1.value
                self[position_2] = card_2.value
                
            end

        end
    end

    def hidden_grid
        letter_bank = ["a", "b", "c", "d", "e", "f", "g", "h"]

        @grid.map do |row|
            row.map do |ele|
                if ele.face_up 
                    ele = ele.value
                else
                    ele
                end
            end
        end
    end

    def render

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

end
