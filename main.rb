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

p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
p %w[ant bear cat].my_any?(/d/)                        #=> false
p [nil, true, 99].my_any?(Integer)                     #=> true
p [nil, true, 99].my_any?                            #=> true
p [].my_any?                                           #=> false


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
   