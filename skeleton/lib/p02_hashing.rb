class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 1
    self.each_with_index do |ele,i|
      sum *= ele.hash ** 2 + (i.hash+2)
    end 
    sum
  end
end

class String
  def hash
    sum = 1
    self.each_char.with_index do |char,i|
      sum += char.ord * (i.hash+2)
    end 
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
 
    
  end
end

