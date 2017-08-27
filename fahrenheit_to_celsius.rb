#Write a method that takes a number that represents Fahrenheit, and returns a number equivalent to it’s value in Celsius. Write a second method that takes an array of numbers in Fahrenheit, and that returns that an array with the numbers in celsius using your first function to make the calculation. In this instance, try to do this without forming a temporary array. (Hint: use a variation on the .each loop.)

def fahrenheit_to_celsius(f)
    (f-32.0) * 5.0/9.0
end

def convert_fahrenheit_array_to_celsius(f_array)
    f_array.map! { |f|
        f = fahrenheit_to_celsius(f)
    }
end

puts convert_fahrenheit_array_to_celsius([120,150,200])