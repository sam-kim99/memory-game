class Card
    attr_reader :value, :face_up
    def initialize(value)
        @face_up = false
        @value = value
    end

    def display
        if @face_up
            @grid[position]
        end
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def ==(another_card)
        @value == another_card.value
    end
end