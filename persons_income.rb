# Using these actual figures, make a method (or methods) that takes as an argument a person’s income, and returns the amount of tax that should be paid on that income (before being fiddled about with various exemptions and deductibles). Return a hash of the raw tax payable (in dollars), and what what percentage of the person's income that represents.
# $0 – $18,200    Nil
# $18,201– $37,000    19c for each $1 over $18,200
# $37,001 - $87,000    $3,572 plus 32.5c for each $1 over $37,000
# $87,001 - $180,000    $19,822 plus 37c for each $1 over $87,000
# $180,001 and over    $54,232 plus 45c for every $1 over $180,000

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
        percentage: tax==nil ? nil : ((tax/income) * 100).round(2).to_s+"%"
    }
end

p amount_of_tax(100000)