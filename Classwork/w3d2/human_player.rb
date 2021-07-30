class HumanPlayer

    def get_input(board)
        print "Please enter the position of the card you'd like to flip (e.g. '2,3'):"
        pos = gets
        x_s, y_s = pos.chomp.split(",").map{|i| i.rstrip }
        x, y = [x_s.to_i, y_s.to_i]
        return [x,y]
    end

end
