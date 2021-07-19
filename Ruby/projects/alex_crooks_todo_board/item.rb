class Item
    def self.valid_date?(date_string)
        dates = date_string.split("-")
        year = dates.first
        month = dates[1]
        date = dates.last
        date.length == 2 && month.length == 2 && year.length == 4 && month.to_i >= 1 && month.to_i <= 12 && date.to_i <= 31 && date.to_i >= 1
    end

    def initialize(title, deadline, description)
        @title = title
        if !Item.valid_date?(deadline)
            raise 'The date entered was not valid.' 
        else
            @deadline = deadline
        end
        @description = description
        @done = false
    end

    def title
        @title
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise 'The date entered was not valid.' 
        else
            @deadline = new_deadline
        end
    end

    def done
        @done
    end

    def description
        @description
    end

    def description=(new_description)
        @description = new_description
    end
    
    def toggle
        if @done
            @done = false
        else
            @done = true
        end
    end
end

