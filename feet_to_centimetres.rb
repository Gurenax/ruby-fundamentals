# Define a method that takes a number of feet, and returns a number representing the total inches,
# and another that takes a number representing inches and returns the number of centimetres.
# Define and call a third function called feet_to_cm that takes a number of feet and returns
# the number of centimetres, but that uses only our previous two functions. Store that number
# in a well-named variable.

class FeetToCentimetres
    # Converts feet to inches
    def get_inches(feet)
        feet * 12.0
    end
    
    # Converts inches to centimetres
    def get_cm(inches)
        inches * 2.54
    end

    # Converts feet to centimetres
    def feet_to_cm(feet)
        self.get_cm(self.get_inches(feet))
    end
end

measurement = FeetToCentimetres.new
ten_feet_to_cm = measurement.feet_to_cm(10)
twenty_feet_to_cm = measurement.feet_to_cm(20)
thirty_feet_to_cm = measurement.feet_to_cm(30)

puts "10 feet is #{ten_feet_to_cm} cm"
puts "20 feet is #{twenty_feet_to_cm} cm"
puts "30 feet is #{thirty_feet_to_cm} cm"