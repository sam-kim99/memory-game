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
end
