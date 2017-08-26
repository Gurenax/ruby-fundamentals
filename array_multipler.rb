# Define the method ten_mult, which takes one argument (a number), and returns the
# result of that number multiplied by 10. Define a method called arr_mult that takes
# an array as an argument. In arr_mult, use the method ten_mult on each element of the
# array that was passed in as the argument. Return the array that results from this
# (each element multiplied by 10), and store in a well-named variable. (edited)

class ArrayMultipler
    def ten_mult(number)
        number * 10
    end

    def arr_mult(array)
        array.map! { |n|
            n=ten_mult(n)
        }
    end
end

numbers_array = [10, 15.5, 25.75, 30.25, 50]
am = ArrayMultipler.new
multiplied_numbers_array = am.arr_mult(numbers_array)

puts multiplied_numbers_array