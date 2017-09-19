# Write a method that takes two arguments, an array and a string. If the string is not the array it returns nil, and if it does contain the string, it returns the index of the string within the array. You will use this in the following question.

def find_string_in_array(array, str)
    p array.index(str)
end

find_string_in_array(["one","dance","drake"],"dance")