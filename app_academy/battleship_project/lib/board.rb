class Board
    attr_reader :size
    attr_writer :grid
  def initialize(n)
    @grid = Array.new(n) {Array.new(n) {:N}}
    @size = n*n
  end
  def [](pos)
    @grid[pos[0]][pos[1]]
  end
  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end
  def num_ships
    count = 0
    @grid.each do |row|
        row.each do |ele|
            if ele == :S
                count += 1
            end
        end
    end
    count
  end
  def attack(pos)
    if self.[](pos) == :S
        self.[]=(pos, :H)
        puts 'you sunk my battleship!'
        return true
    else
        self.[]=(pos, :X)
        return false
    end
  end
  def place_random_ships
    total_ships = 0.25 * @size
    while self.num_ships < total_ships
    row = rand(0...@grid.length)
    col = rand(0...@grid.length)
    pos = [row, col]
    self[pos] = :S
    end
  end
  def hidden_ships_grid
    copy = @grid.map(&:clone)
    copy.each_with_index do |row, i|
        row.each_with_index do |ele, j|
            if ele == :S
                copy[i][j] = :N
            end
        end 
    end
    copy
  end
  def self.print_grid(arr)
    arr.each {|ele| puts ele.join(" ")}
  end

  def cheat
    Board.print_grid(@grid)
  end
  
  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
