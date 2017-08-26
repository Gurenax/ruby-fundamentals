#Define a method that takes an array of numbers, and returns the total of the addition of
#all the numbers in the array. Store the result of a call to this method in a well-named variable.

class SumOfArrayValues
    def sum_array(array)
        sum = 0
        array.map { |n|
            sum += n
        }
        sum
    end
end

numbers_array = [10, 15.5, 25.75, 30.25, 50]
sum = SumOfArrayValues.new
sum_of_array_values = sum.sum_array(numbers_array)
p sum_of_array_values