require_relative "item"

class List
    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description = "")
        if !Item.valid_date?(deadline)
            return false 
        else
            @items << Item.new(title, deadline, description)
            return true
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index >= 0 && index < size
    end

    def swap(index_1, index_2)
        index_1 = index_1.to_i
        index_2 = index_2.to_i
        return false if !self.valid_index?(index_1) || !self.valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        return nil if !self.valid_index?(index)
        @items[index]
    end

    def priority
        @items.first
    end

    def print
        puts "-" * 46
        puts @label.upcase.rjust(25)
        puts "-" * 46
        puts "Index  |  Item".ljust(25) + "|  Deadline   |  Done"
        puts "-" * 46
        @items.each_with_index do |ele, i|
            if ele.done
                puts i.to_s.ljust(7) + "|  " + ele.title.ljust(15) + "|  " + ele.deadline + " |  [✓]"  
            else
                puts i.to_s.ljust(7) + "|  " + ele.title.ljust(15) + "|  " + ele.deadline + " |  [ ]"  
            end
        end
        puts "-" * 46
    end

    def print_full_item(index)
        index = index.to_i
        puts "-" * 45
        if @items[index].done
        puts @items[index].title.ljust(20) + @items[index].deadline.ljust(20) + "[✓]"
        else
        puts @items[index].title.ljust(20) + @items[index].deadline.ljust(20) + "[ ]"
        end
        puts @items[index].description
        puts "-" * 45
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index,amount = 1)
        index = index.to_i
        amount = amount.to_i
        return false if !valid_index?(index)
        while amount > 0
            return true if index == 0
            self.swap(index-1, index)
            amount -= 1
            index -= 1
        end          
        return true
    end

    def down(index,amount = 1)
        index = index.to_i
        amount = amount.to_i
        return false if !valid_index?(index)
        while amount > 0
            return true if index == self.size - 1
            self.swap(index, index+1)
            amount -= 1
            index += 1
        end          
        return true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        index = index.to_i
        @items[index].toggle
    end

    def remove_item(index)
        index = index.to_i
        @items.delete_at(index)
    end

    def purge
        @items.delete_if {|i| i.done}
    end

end