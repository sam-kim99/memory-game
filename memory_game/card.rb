class Card
    def initialize
        @face_up = false 
        @face_down = false
    end

    def display
        if @face_up
            @grid[position]
        end
    end

    def hide
        if @face_up 
            @face_down
        end
    end

    def reveal
        if @face_down
            @face_up
        end
    end

    def flip

    end
end