# rubocop:disable Style/For
# rubocop:disable Metrics/ModuleLength
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
module Enumerable
  def my_each
    return enum_for unless block_given?

    if instance_of?(Hash)
      for i in 0..length - 1 do
        yield keys[i], values[i]
      end
    else
      for i in 0..to_a.length - 1 do
        yield to_a[i]
      end
    end
    self
  end

  def my_each_with_index
    return enum_for unless block_given?

    if instance_of?(Hash)
      for i in 0..length - 1 do
        yield keys[i], values[i], i
      end
    else
      for i in 0..to_a.length - 1 do
        yield to_a[i], i
      end
    end
    self
  end

  def my_select
    return enum_for unless block_given?

    new_arr = to_a
    new_arr_two = []
    new_arr.my_each { |i| new_arr_two << i if yield i }
    new_arr_two
  end

  def my_all?(*arg)
    counter = true
    if block_given?
      my_each do |i|
        counter = false unless yield i
      end
    elsif arg[0]
      if arg[0] == Regexp
        my_each do |i|
          counter = false unless arg[0].match?(i)
        end
      elsif arg[0].is_a?(Class)
        my_each do |i|
          counter = false unless i.is_a?(arg[0])
        end
      else
        my_each do |i|
          counter = false unless i == arg[0]
        end
      end
    else
      my_each do |i|
        counter = false unless i
      end
    end
    counter
  end

  def my_any?(*arg)
    counter = false
    if block_given?
      my_each do |i|
        return true if yield i
      end
    elsif arg[0]
      if arg[0] == Regexp
        my_each do |i|
          return true if arg[0].match?(i)
        end
      elsif arg[0].is_a?(Class)
        my_each do |i|
          return true if i.is_a?(arg[0])
        end
      else
        my_each do |i|
          return true if i == arg[0]
        end
      end
    else
      my_each do |i|
        return true if i
      end
    end
    counter
  end

  def my_none?(*arg)
    counter = true
    if block_given?
      my_each do |i|
        counter = false if yield i
      end
    elsif arg[0]
      if arg[0] == Regexp
        my_each do |i|
          counter = false if arg[0].match?(i)
        end
      elsif arg[0].is_a?(Class)
        my_each do |i|
          counter = false if i.is_a?(arg[0])
        end
      else
        my_each do |i|
          counter = false if i == arg[0]
        end
      end
    else
      my_each do |i|
        counter = false if i
      end
    end
    counter
  end

  def my_count(*arg)
    counter = 0
    if block_given?
      my_each do |i|
        counter += 1 if yield i
      end
    elsif arg[0]
      if arg[0] == Regexp
        my_each do |i|
          counter += 1 if arg[0].match?(i)
        end
      elsif arg[0].is_a?(Class)
        my_each do |i|
          counter += 1 if i.is_a?(arg[0])
        end
      else
        my_each do |i|
          counter += 1 if i == arg[0]
        end
      end
    else
      my_each do |i|
        counter += 1 if i
      end
    end
    counter
  end

  def my_map(*arg)
    map_val = []
    if block_given? && arg[0].is_a?(Proc)
      my_each do |i|
        map_val << i if arg[0].call(i)
      end
    elsif block_given?
      my_each do |i|
        map_val << i if yield i
      end
    elsif arg[0]
      if arg[0] == Regexp
        my_each do |i|
          map_val << i if arg[0].match?(i)
        end
      elsif arg[0].is_a?(Class)
        my_each do |i|
          map_val << i if i.is_a?(arg[0])
        end
      elsif arg[0].is_a?(Proc)
        my_each do |i|
          map_val << i if arg[0].call(i)
        end
      else
        my_each do |i|
          map_val << i if i == arg[0]
        end
      end
    else
      my_each do |i|
        map_val << i if i
      end
    end
    map_val
  end

  def my_inject(*arg)
    if block_given? && arg[0]
      result = arg[0]
      my_each do |i|
        result = yield result, i
      end
    elsif block_given?
      result = self[0]
      my_each do |i|
        result = yield result, i
      end
    elsif arg[0] && arg[1]
      result = arg[0]
      for i in (0..to_a.length - 1) do
        result = result.send(arg[1], to_a[i])
      end
    else
      result = to_a[0]
      for i in (1..to_a.length - 1) do
        result = result.send(arg[0], to_a[i])
      end
    end
    result
  end
end

def multiply_els(*arg)
  arr = arg[0].to_a
  arr.my_inject(:*)
end

# rubocop:enable Style/For
# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
