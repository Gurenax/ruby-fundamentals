# Define 4 methods. The first takes a string, and then returns the string + “ will be”,
# the second takes a string, and returns the string + “ won’t be”, the third takes a string
# and returns the string + “ impeached.” and the fourth is called trump_predictor.
# trump_predictor takes a string, but then you must use the previous functions to get from this
# method call trump_predictor(“Trump”) to whatever outcome you think is more likely, but using
# only the previously defined functions. Store the output of trump_predictor in a well named
# variable. (For example, if you think he won’t be impeached, only call the methods that matter,
# so the output string will be “Trump won’t be impeached.”)

class Trump
    # Trump will be
    def will_be(string)
        self.impeached("#{string} will be")
    end

    # Trump won't be
    def wont_be(string)
        self.impeached("#{string} won't be")
    end

    # Trump will be impeached
    # Trump won't be impeached
    def impeached(string)
        "#{string} impeached"
    end

    # Trump
    def trump_predictor(string)
        self.will_be(string)
    end
end

president = Trump.new
trump_will_be_impeached = president.trump_predictor("Trump")
puts trump_will_be_impeached