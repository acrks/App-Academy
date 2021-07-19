require_relative "item"
require_relative "list"

class TodoBoard
    def initialize
        @list = {}
    end

    def get_command
        print "Enter a command: "
        cmd, list, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @list[list] = List.new(list)
        when 'ls'
            @list.keys.each do |name|
                puts name
            end
        when 'showall'
            @list.each_value do |i|
                i.print
            end
        when 'mktodo'
            @list[list].add_item(*args)
        when 'up'
            @list[list].up(*args)
        when 'down'
            @list[list].down(*args)
        when 'swap'
            @list[list].swap(*args)
        when 'sort'
            @list[list].sort_by_date!
        when 'priority'
            @list[list].print_priority
        when 'print'
            if args.empty?
                @list[list].print 
            else
                @list[list].print_full_item(*args)
            end
        when 'toggle'
            @list[list].toggle_item(*args)
        when 'purge'
            @list[list].purge
        when 'rm'
            @list[list].remove_item(*args)
        when 'quit'
            return false
        else
            puts 'Sorry, that commmand is not recognized.'
        end

        true
    end

    def run
        while self.get_command
        end
    end
end

l = TodoBoard.new()
l.run