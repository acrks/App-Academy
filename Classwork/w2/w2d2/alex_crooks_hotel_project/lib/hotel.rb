require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = {}
    hash.each do |k,v|
        @rooms[k] = Room.new(v)
        end
    end

    def name
        names = @name.split.map! { |i| i.capitalize() }
        @name = names.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(person, room)
        if !self.room_exists?(room)
            p 'sorry, room does not exist'
        else
            if @rooms[room].add_occupant(person)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        end
    end

    def has_vacancy?
        @rooms.any? {|room, occupants| !@rooms[room].full? }
    end

    def list_rooms
        @rooms.each do |k, v|
            puts k + ": " + v.available_space.to_s + "\n"
        end
    end
end
