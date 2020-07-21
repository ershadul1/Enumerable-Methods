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

  def my_all?
    counter = true
    if block_given?
      for i in 0..self.length-1 do
        unless yield self[i]
          counter = false
        end
      end
    else
      for i in 0..self.length-1 do
        unless self[i]
          counter = false
        end
      end
    end
    counter
  end
  
def my_any?
  counter = false
  if block_given? 
    for i in 0..self.length-1 do
    if yield self[i]
      counter = true
    end
  end
    else
      for i in 0..self.length-1 do
        if yield self[i] 
          counter = true
        end
      end
    end
      counter
    end
    
    def my_none?
      value = true
      if block_given? 
      for i in 0..self.length-1 do
        if yield(self[i]) == true
         value = false
        end
      end
  else
    for i in 0..self.length-1 do
      if yield (self[i]) == true
        counter = false
      end
      
    end
    
  end
     value
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




#p %w[ant bear cat].my_none? { |word| word.length == 5} #=> true
#p %w[ant bear cat].my_none? { |word| word.length >= 4 } #=> false
# p %w[ant bear cat].my_all?(/t/)                        #=> false
# # p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# # p [nil, true, 99].my_all?                              #=> false
# # p [].all?                                           #=> true


p (3..8).my_select { |i| i < 5 }

# rubocop:enable Style/For