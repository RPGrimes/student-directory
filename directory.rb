def input_students
  puts "Please enter the names of students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do 
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another student name from the user
    name = gets.chomp
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
    puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
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