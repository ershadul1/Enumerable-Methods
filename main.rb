# rubocop:disable Style/For
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
        counter +=1 if arg[0].match?(i)
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
    
  def my_map (*arg)
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
      for i in (0..self.to_a.length - 1) do
        result = result.send(arg[1], self.to_a[i])
      end
    else
      result = self.to_a[0]
      for i in (1..self.to_a.length - 1) do
        result = result.send(arg[0], self.to_a[i])
      end
    end
    result
  end

  

      
end
ar = {"name" => "Rayhan", "sch"=> "microverse"}


# arr = ["umar", "rayhan", "mj"]

# p arr.my_select {|i| i != "mj" }


# ar.my_each_with_index do |key, value, index|
#   puts "#{key} is #{value} index is = #{index}"
# end

# #ar.my_each_with_index do |i, index|
# #  puts "value = #{i} , index = #{index}"


# #end




# p %w[ant bear cat].my_all?(/t/)                        #=> false
# p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# p [nil, true, 99].my_all?                              #=> false
# p [].my_all?                                           #=> true

# p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
# p %w[ant bear cat].my_any?(/d/)                        #=> false
# p [nil, true, 99].my_any?(Integer)                     #=> true
# p [nil, true, 99].my_any?                            #=> true
# p [].my_any?                                           #=> false


# p (3..8).my_select { |i| i < 5 }
# p ["ant", "bear", "cat"].my_all? { |word| word.length > 3
# }
#p [nil, true, 99].my_all? 
#p [].my_all? 

# rubocop:enable Style/For
  
 #p %w[ant bear cat].my_all?(/t/)
 #p [].my_all?                                            #=> true
 
 #p %w[ant bear cat].my_none? { |word| word.length == 5}
 
# p %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
# p %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
# p %w{ant bear cat}.my_none?(/d/)                        #=> true
# p [1, 3.14, 42].my_none?(Float)                         #=> false
# p [].my_none?                                           #=> true
# p [nil].my_none?                                        #=> true
# p [nil, false].my_none?                                 #=> true
# p [nil, false, true].my_none?                           #=> false

ary = [1, 2, 5, 4]
# p ary.my_count               #=> 4
# p ary.my_count(2)            #=> 2
# p ary.my_count{ |x| x%2==0 } #=> 3

#p ary.my_inject(:+)

p %w{ cat sheep bear }.my_inject { |memo, word| memo.length > word.length ? memo : word }

p (5..10).my_inject(1, :*)   

p (5..10).my_inject(:+)  

def multiply_els(*arg)
  arr = arg[0].to_a
  arr.my_inject(:*)
end

p multiply_els([2,4,5])


my_proc = Proc.new {|x| x>2 }

p ary.my_map { |i| i > 1}