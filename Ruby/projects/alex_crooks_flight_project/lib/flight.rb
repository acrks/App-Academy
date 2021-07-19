class Flight
    def initialize(flight_num, capacity)
        @flight_number = flight_num
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(pas)
        @passengers << pas if !self.full? && pas.has_flight?(@flight_number)
    end

    def list_passengers
        @passengers.collect { |i| i.name }
    end

    def [](number)
        @passengers[number]
    end

    def <<(pas)
        self.board_passenger(pas)
    end
end