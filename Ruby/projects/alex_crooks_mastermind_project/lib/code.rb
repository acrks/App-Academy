class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

def self.valid_pegs?(arr)
  arr.all? { |ele| POSSIBLE_PEGS.has_key?(ele.upcase)}
end

def initialize(chars)
  raise if !Code.valid_pegs?(chars)
  @pegs = chars.map {|ele| ele.upcase}
end

def pegs
  @pegs
end

def self.random(length)
  pegs = []
  (0...length).each { pegs << POSSIBLE_PEGS.keys.sample }
  Code.new(pegs)
end

def self.from_string(string)
  Code.new(string.split(""))
end

def [](idx)
  @pegs[idx]
end

def length
  @pegs.length
end

def num_exact_matches(inst)
  count = 0
  inst.pegs.each_with_index do |ele, i| 
    count += 1 if ele == pegs[i]
  end
  count
end

def num_near_matches(inst)
  count = 0
  inst.pegs.each_with_index do |ele, i| 
    count += 1 if (self.pegs.include?(ele)) && (ele != self[i])
  end
  count
end

def ==(alt_inst)
  alt_inst.pegs == self.pegs
end

end
