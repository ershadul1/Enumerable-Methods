module Enumerable
  def my_each
    if self.instance_of?(Array)
      for i in 0..self.length-1 do
          yield self[i]
      end
      self
      
    elsif self.instance_of?(Hash)
      for i in 0..self.length-1 do
          yield keys[i], values[i]
      end
      self
    end
  end
end

# ar = {"name" => "Rayhan", "sch"=> "microverse"}
# arr = [1, 2, 3]

# ar.my_each do |key, value|
#   puts "#{key} is #{value}"
# end

# arr.my_each do |i|
#   puts i
# end



