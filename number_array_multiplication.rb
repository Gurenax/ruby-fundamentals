# Define an array with three numbers in it.
# Then write a method that takes two arguments.
# The first argument will be an array.
# The second will be a number.
# I want this method to return the array that would result if
# each element in the array was multiplied by the second argument.
# Return the result. Call this function with your array and an argument
# of your choice, and store the result in a well-named variable.

class NumberArrayMultiplication
    # Multiply the array of numbers with a multiplier
    def multiply_array(array_of_numbers, multiplier)
        array_of_numbers.map { |number|
            number *= multiplier
        }
    end
end

numbers = [10.5, 20.75, 30]
multiplier = 5
operation = NumberArrayMultiplication.new
array_of_multiplied_numbers = operation.multiply_array(numbers, multiplier)
puts array_of_multiplied_numbers