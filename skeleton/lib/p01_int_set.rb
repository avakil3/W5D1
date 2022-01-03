class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num) 
       @store[num] = true 
       true
    else
       raise "Out of bounds"
    end
  end

  def remove(num)
    is_valid?(num) ? @store[num] = false : (raise "Out of bounds")
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
     num >=0 && num < @store.length ? true : false
  end

  def validate!(num)
    
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if  !self.include?(num)
      @store[num % num_buckets] << num
      true
    end
  end

  def remove(num)
    if  self.include?(num)
      @store[num % num_buckets].delete(num)
      true
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
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
    if !self.include?(num)
      @store[num % num_buckets] << num
      @count+=1
      true
    end
    if @count == num_buckets
     resize!
    end
  end

  def remove(num)
    if self.include?(num)
      @store[num % num_buckets].delete(num)
      @count-=1
      true
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(num_buckets) {[]}
    @store.flatten.each do |ele|
      @store[ele % num_buckets] << ele
    end
  end
end
