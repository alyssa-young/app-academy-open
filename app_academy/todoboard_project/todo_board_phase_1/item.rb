class Item
    attr_reader :description
    attr_accessor :title, :deadline, :description
    def self.valid_date?(date_string)
        date = date_string.split("-")
        return (1..12).include?(date[1].to_i) && (1..31).include?(date[2].to_i) && date[0].length == 4
    end
    def initialize(title, deadline, description)
        raise 'invalid deadline' if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
    end
    def deadline=(new_deadline)
        raise 'invalid date' if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end
end
