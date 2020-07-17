module Enumerable
  def my_each
    if self.instance_of?(Array)
      for i in 0..self.length-1 do
          yield self[i]
      end
    elsif self.instance_of?(Hash)
      for i in 0..self.length-1 do
          yield keys[i], values[i]
      end
    end
  end

  def my_each_with_index
    if self.instance_of?(Array)
      for i in 0..self.length-1 do
          yield self[i], i
      end
    
    elsif self.instance_of?(Hash)
      for i in 0..self.length-1 do
          yield keys[i], values[i] , i
      end
    end
  end
  
  def my_select
    new_arr = []
    for i in 0..self.length-1 do
      if yield self[i] 
      new_arr << self[i]
    end
  end
  new_arr
  end

  def my_all?
    counter = true
    if block_given? 
      for i in 0..self.length-1 do
        unless yield self[i]
          counter = false
          counter
        end
      end
    else 
      for i in 0..self.length-1 do
        unless self[i]
          counter = false
          counter
        end
      end
    end
   
  end





end
# ar = {"name" => "Rayhan", "sch"=> "microverse"}


# arr = ["umar", "rayhan", "mj"]

# p arr.my_select {|i| i != "mj" }


# ar.my_each_with_index do |key, value, index|
#   puts "#{key} is #{value} index is = #{index}"
# end

# #ar.my_each_with_index do |i, index|
# #  puts "value = #{i} , index = #{index}"
# #end

p %w[ant bear cat].all? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
p %w[ant bear cat].all?(/t/)                        #=> false
p [1, 2i, 3.14].all?(Numeric)                       #=> true
p [nil, true, 99].all?                              #=> false
p [].all?                                           #=> true