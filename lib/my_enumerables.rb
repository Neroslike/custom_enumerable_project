module Enumerable
  # Your code goes here
  def my_each
    for i in self
      yield i
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < length
      el = self[i]
      yield el, i
      i += 1
    end
    self
  end

  def my_select(&block)
    results = []
    for i in self
      results << i if block.call(i)
    end
    results
  end

  def my_all?(&block)
    return true if my_select { |element| block.call(element) }.length == length

    false
  end

  def my_any?(&block)
    return true if my_select { |element| block.call(element) }.length.positive?

    false
  end

  def my_none?(&block)
    return false if my_any? { |element| block.call(element) }

    true
  end

  def my_count(&block)
    result = 0
    len = 0
    if block_given?
      my_select { |element| result += 1 if block.call(element) }
    else
      my_each { |element| len += 1}
      return len
    end
    result
  end

  def my_map(&block)
    result = []
    my_each { |element| result << block.call(element) }
    result
  end

  def my_inject(initial = nil, &block)
    sum = 0
    initial == nil ? initial = first : initial = initial
    my_each do  |element| 
      initial = block.call(initial, element)
      sum = initial
    end
    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
end
