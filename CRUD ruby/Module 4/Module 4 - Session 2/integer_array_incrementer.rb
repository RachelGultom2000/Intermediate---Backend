class IntegerArrayIncrementer
   def increment(input)
      # [1]
      # #return [input.first + 1]
      incremented = input[-1] + 1
      if input.size == 1
         if incremented >= 10
            diff = 10 - incremented
            [1, diff]
         else
            [incremented]
         end
      else
         result = input
         result[-1] = incremented
         result
      end
 
   end
end