require './item.rb'
class List
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end
    def add_item(title, deadline, description = "")
        if !Item.valid_date?(deadline)
            return false
        end
        new_item = Item.new(title, deadline, description)
        @items << new_item
        true
    end
    def size
        @items.length
    end
    def valid_index?(index)
        len = @items.length 
        return true if index >= 0 && index < len
    end
    def swap(index_1, index_2)
        if !valid_index?(index_1) || !valid_index?(index_2)
            return false
        end
        temp = @items[index_1]
        @items[index_1] = @items[index_2]
        @items[index_2] = temp
        true
    end
    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end
    def priority
        return @items.first
    end
    def print
        puts "----------------------------------------------------------"
        puts "                    #{@label}                             "
        puts "----------------------------------------------------------"
        puts "Index".ljust(20) + "|Item ".ljust(20) + "|Deadline".ljust(20)
        puts "----------------------------------------------------------"
        @items.each_with_index do |item, i|
            puts "#{i}".ljust(20) + "|#{item.title}".ljust(20) + "#{item.deadline}".ljust(20)
        end
        puts "----------------------------------------------------------"
    end
    def print_full_item(index)
        return if !valid_index?(index)
        puts "----------------------------------------------------------"
        item = @items[index]
        puts "#{item.title}".ljust(38) + "#{item.deadline}".rjust(20)
        puts "#{item.description}".ljust(20)
        puts "----------------------------------------------------------"
    end
    def print_priority
        print_full_item(0)
    end
    def up(index, amount=1)
        return false if !valid_index?(index)
        new_index = index - amount
        item = @items.delete(@items[index])
        if new_index < 0 
            @items.unshift(item)
        else 
            @items.insert(new_index, item)
        end
        true
    end
    def down(index, amount=1)
        return false if !valid_index?(index)
        new_index = index + amount
        item = @items.delete(@items[index])
        if new_index > @items.length - 1
            @items.push(item)
        else 
            @items.insert(new_index, item)
        end
        true
    end
    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end
end
