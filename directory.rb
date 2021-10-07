def input_students
  puts "Please enter the name of a student"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  puts "Please enter the students country of birth"
  country_of_birth = gets.chomp
  puts "Please enter the students height in cm"
  height = gets.chomp.to_str
  puts "To finish, just enter blank entries for name, country of birth and height"
  #while the name is not empty, repeat this code
  while !name.empty? do 
    students << {name: name, cohort: :november, pob: country_of_birth, height: height}
      puts "Now we have #{students.count} students"
    #get another student name from the user
      puts "Please enter another students name"
      name = gets.chomp
      puts "Please enter the students country of birth"
      country_of_birth = gets.chomp
      puts "Please enter the students height in cm"
      height = gets.chomp.to_str
      puts "To finish, just hit return twice"
  end
  #return an array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "_____________"
end

def print(students)
#Rewrite the each() method , as above, that prints all students using while or until control flow methods (Loops).
  index = 0
  while index < students.length
    puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort), born in the great nation of #{students[index][:pob]} and standing #{students[index][:height]}cm tall!"
    index += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
#call methods so code runs
print_header
print(students)
print_footer(students)