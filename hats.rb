# 100 students are sitting in a row, and each is wearing a hat.
# You walk along the line of students, and take off every hat.

# You pass them all again, and this time, when you get to every second
# student if their hat is off you put it on, and if it's on you take it off.

# The third pass you only deal with every third student, and again,
# if their hat is off you put it on, but if it's on you take it off.

# You continue this process with each further pass you toggle
# the 'hat state' of every fourth student, then fifth, and so on,
# until you have passed by the students 100 times.
# What is the state of the hats when you have finished?

class Hats  # Hats is the man who walks along students

    attr_accessor :number_of_students   # number_of_students : Integer
    attr_accessor :students             # students : Array of Student

    def initialize(number_of_students)
        @number_of_students = number_of_students
        @students = []
        self.number_of_students.times { # Initialize 100 Students
            @students << Student.new
        }
    end

    # Walk the line of students
    def walk_the_line_of_students(number_of_passes)
        student_index = 1   # Start with the first student
        pass = 1
        number_of_passes.times {
            self.students.each { |student|
                # Take every X_Pass student's hat on if it's off and off if it's on
                #puts "pass:#{pass} student:#{student_index} mod:#{student_index % pass}"
                if student_index % pass == 0
                    # If hat on, take off. If hat off, put on.
                    student.hat_state ? student.take_hat_off : student.put_hat_on
                end
                student_index += 1
            }
            pass += 1
            student_index = 1
        }
    end

    # Display All Students' Hat State
    def display_students_hat_state
        student_index = 1
        self.students.each { |student|
            print "Student #{student_index}'s Hat is "
            puts student.hat_state ? "on" : "off"
            
            student_index += 1
        }
    end
end

class Student
    attr_accessor :hat_state  # hat_state : Boolean

    def initialize
        @hat_state = true # Hats On by Default
    end

    # Put student's hat on
    def put_hat_on
        self.hat_state = true
    end
    
    # Take student's hat off
    def take_hat_off
        self.hat_state = false
    end
end

hatter = Hats.new(100) # 100 students
hatter.walk_the_line_of_students(100) # 100 passes
hatter.display_students_hat_state

# Answer:
# Student 1's Hat is off
# Student 2's Hat is on
# Student 3's Hat is on
# Student 4's Hat is off
# Student 5's Hat is on
# Student 6's Hat is on
# Student 7's Hat is on
# Student 8's Hat is on
# Student 9's Hat is off
# Student 10's Hat is on
# Student 11's Hat is on
# Student 12's Hat is on
# Student 13's Hat is on
# Student 14's Hat is on
# Student 15's Hat is on
# Student 16's Hat is off
# Student 17's Hat is on
# Student 18's Hat is on
# Student 19's Hat is on
# Student 20's Hat is on
# Student 21's Hat is on
# Student 22's Hat is on
# Student 23's Hat is on
# Student 24's Hat is on
# Student 25's Hat is off
# Student 26's Hat is on
# Student 27's Hat is on
# Student 28's Hat is on
# Student 29's Hat is on
# Student 30's Hat is on
# Student 31's Hat is on
# Student 32's Hat is on
# Student 33's Hat is on
# Student 34's Hat is on
# Student 35's Hat is on
# Student 36's Hat is off
# Student 37's Hat is on
# Student 38's Hat is on
# Student 39's Hat is on
# Student 40's Hat is on
# Student 41's Hat is on
# Student 42's Hat is on
# Student 43's Hat is on
# Student 44's Hat is on
# Student 45's Hat is on
# Student 46's Hat is on
# Student 47's Hat is on
# Student 48's Hat is on
# Student 49's Hat is off
# Student 50's Hat is on
# Student 51's Hat is on
# Student 52's Hat is on
# Student 53's Hat is on
# Student 54's Hat is on
# Student 55's Hat is on
# Student 56's Hat is on
# Student 57's Hat is on
# Student 58's Hat is on
# Student 59's Hat is on
# Student 60's Hat is on
# Student 61's Hat is on
# Student 62's Hat is on
# Student 63's Hat is on
# Student 64's Hat is off
# Student 65's Hat is on
# Student 66's Hat is on
# Student 67's Hat is on
# Student 68's Hat is on
# Student 69's Hat is on
# Student 70's Hat is on
# Student 71's Hat is on
# Student 72's Hat is on
# Student 73's Hat is on
# Student 74's Hat is on
# Student 75's Hat is on
# Student 76's Hat is on
# Student 77's Hat is on
# Student 78's Hat is on
# Student 79's Hat is on
# Student 80's Hat is on
# Student 81's Hat is off
# Student 82's Hat is on
# Student 83's Hat is on
# Student 84's Hat is on
# Student 85's Hat is on
# Student 86's Hat is on
# Student 87's Hat is on
# Student 88's Hat is on
# Student 89's Hat is on
# Student 90's Hat is on
# Student 91's Hat is on
# Student 92's Hat is on
# Student 93's Hat is on
# Student 94's Hat is on
# Student 95's Hat is on
# Student 96's Hat is on
# Student 97's Hat is on
# Student 98's Hat is on
# Student 99's Hat is on
# Student 100's Hat is off