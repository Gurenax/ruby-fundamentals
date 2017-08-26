#Write a method called exponent_plus that takes two arguments, and both will be numbers. It will return the total of the first number to the power of 2, added to the second number. Write another method, arr_exp, that takes three arguments. The first arguments expect numbers, and the last argument will be an array of numbers. This method will return an array that is the result of each element of the array multiplied by the result of exponent_plus when called with the other two arguments to arr_exp. At least once, store the result of a call to arr_exp in a well-named variable.

def exponent_plus(a, b)
    (a ** 2) + b
end

def arr_exp(a, b, c)
    exp_plus = exponent_plus(a,b)
    c.map! { |num|
        num *= exp_plus
    }
end

p arr_exp(1,2,[1,2,3])