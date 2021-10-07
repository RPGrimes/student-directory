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
  puts "Enter a letter to return names beginning with the selected letter"
  letter = gets.chomp
  students.each_with_index do |student, index|
    if student[:name][0] == letter
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
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
