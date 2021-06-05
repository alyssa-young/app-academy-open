class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(arr)
    arr.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:capitalize)
    else
      raise 'array does not contain valid pegs'
    end
  end

  def self.random(len)
    random = []
    len.times { random << POSSIBLE_PEGS.keys.sample}
    Code.new(random)
  end
  def self.from_string(str)
    input = str.split("")
    Code.new(input)
  end
  def [](idx)
    @pegs[idx]
  end
  def length
    @pegs.length
  end
  def num_exact_matches(code_instance)
    matches = []
    code_instance.pegs.each_with_index do |ele, idx|
      if ele == @pegs[idx] && !matches.include?(ele)
        matches << ele
      end
    end
    matches.length
  end
  def num_near_matches(code_instance)
    matches = []
    code_instance.pegs.each_with_index do |ele, idx|
      if ele != @pegs[idx] && @pegs.include?(ele)
        matches << ele
      end
    end
    matches.length
  end
  def ==(code_instance)
    self.pegs == code_instance.pegs
  end
end
