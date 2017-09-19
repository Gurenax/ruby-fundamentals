# Write a method that asks the user for a salary (as number), and a percentage. The percentage will be a guess by the person as to how much tax is paid on a certain salary. Using the previous method (Problem 15), return a hash of a the guess, the actual percentage, and the difference between the two (a three key hash). Write to screen each of these in a readable format. (You might consider cleaning the user input as a small extension.)

# from persons_income.rb
def amount_of_tax(income)
    case income
        when 0..18200 then
            tax = nil
        when 18201..37000 then
            tax = income * 0.19
        when 37001..87000 then
            tax = 3572.00 + (income * 0.325)
        when 87001..180000 then
            tax = 19822.00 + (income * 0.37)
        else
            if income>=180001
                tax = 54232.00 + (income * 0.45)
            end
    end
    tax_payable = {
        tax: tax,
        percentage: tax==nil ? nil : ((tax/income) * 100).round(2)
    }
end

def ask_for_salary
    print "Enter your salary: "
    salary = gets.to_f

    print "Enter percentage guess: "
    percentage_guess = gets.to_f

    actual_salary = amount_of_tax(salary)
    result = {
        guess_percentage: percentage_guess.to_s+"%",
        actual_percentage: actual_salary[:percentage].to_s+"%",
        difference: (actual_salary[:percentage] - percentage_guess).abs.to_s+"%"
    }

    puts "\nYour guess percentage: #{result[:guess_percentage]}"
    puts "The actual percentage: #{result[:actual_percentage]}"
    puts "Difference between your guess and the actual: #{result[:difference]}"
end

ask_for_salary