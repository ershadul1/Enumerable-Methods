#module Enumerable
  def my_each(obj)
    len = obj.length
    for i in 0..len do 
       obj[i]
    end
  end
#end

ar = [1, 5, 0, 89]

ar.my_each