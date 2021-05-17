class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def out_of_bounds(num)
    raise 'out of bounds' if !num.between?(0, @max)
  end

  def insert(num)
    p num
    self.out_of_bounds(num)
    @store[num] = true
  end

  def remove(num)
    self.out_of_bounds(num)
  end

  def include?(num)
    self.out_of_bounds(num)
    return @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end

n = MaxIntSet.new(5)
n.out_of_bounds(49)