#Write a method that takes one argument, a number, and that returns true if the number is divisible by three, and false otherwise. Write another method that takes an array (of numbers) as an argument. This method will return two arrays, in one array (an array of arrays), the first array containing the numbers that are divisible by 3, and the other of the rest of the numbers. use the first function to achieve this. For example, if you pass the second number [9, 4, 3, 5, 30, 2, 8] it would return [[9, 3, 30],[4, 5, 2, 8]].

def is_divisible_by_three(number)
    number % 3 == 0
end

def check_array_for_numbers_divisble_by_three(numbers)
    divisible = []
    numbers.map! { |num|
        if is_divisible_by_three(num)
            divisible << num
            num = nil   # Delete the number
        else
            num = num   # Do nothing to the number
        end
    }.compact!

    [divisible, numbers]
end

p check_array_for_numbers_divisble_by_three([9, 4, 3, 5, 30, 2, 8])