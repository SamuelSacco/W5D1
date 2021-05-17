class MaxIntSet
  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' if !is_valid?(num)  
    @store[num] = true
  end

  def remove(num)
    raise 'Out of bounds' if !is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    raise 'Out of bounds' if !is_valid?(num)  
    return @store[num]
  end

  private

  def is_valid?(num)
    (0..@max).to_a.include?(num)  
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store, :size
  def initialize(num_buckets = 20)
    @size = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @size]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :size

  def initialize(num_buckets = 20)
    @size = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    
    unless self[num].include?(num)
      resize!
      self[num] << num 
      self.count += 1
    end

  end

  def remove(num)
    return unless self[num].include?(num)
    self[num].delete(num)
    self.count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    if size <= count
      @store += Array.new(size) {Array.new}
    end
  end
end

n = MaxIntSet.new(5)
