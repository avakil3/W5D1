class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !self.include?(key)
      @store[key.hash % num_buckets] << key
      @count+=1
      true
    end
    if @count == num_buckets
     resize!
    end
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    if self.include?(key)
      @store[key.hash % num_buckets].delete(key)
      @count-=1
      true
    end
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
