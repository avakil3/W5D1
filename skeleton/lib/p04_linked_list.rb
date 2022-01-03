class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self.empty? ? nil : head.next
  end

  def last
    self.empty? ? nil : tail.prev
  end

  def empty?
    head.next == tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
      new_node = Node.new(key, val)
      tail.prev.next = new_node
      new_node.prev = last
      new_node.next = tail
      tail.prev = new_node
      new_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    node = head.next
    until node == tail
      yield node
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
