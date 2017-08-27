#Write a method that takes two arrays of numbers, both of the same length. It will return an array in which each element is the result of the corresponding elements in the two array arguments added together. Make a call to your method, and store the result in a well-named variable.

def add_two_arrays( array1, array2 )
    array_sum = []
    array1.each_with_index { |num, index|
        array_sum << array1[index] + array2[index]
    }
    array_sum
end

p add_two_arrays([5,10,15], [10,20,30])