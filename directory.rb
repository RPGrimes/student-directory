def input_students
  puts "Please enter the names of students and their cohorts one after the other"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.strip
  #get the cohort
  cohort = gets.strip.downcase.to_sym
  #while the name is not empty, repeat this code
  while !name.empty? do 
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    #get another student name from the user
    name = gets.strip
    cohort = gets.strip.downcase.to_sym
    months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
    if months.include? cohort
      cohort
    end
    if cohort.empty?
      break
    end
    while !months.include? cohort do
      puts "Enter a valid cohort name (i.e. a month of the year)"
      cohort = gets.strip.downcase.to_sym
    end
  end
#return an array of students
students
end

def print_header
puts "The students of Villains Academy"
puts "_____________"
end

def print(students)
#print students group by cohort
if !students.empty? 
  students
else
  puts "There are no students attending the academy :("
end

cohorts = students.map do |student|
  student[:cohort]
end 
cohorts.uniq.each do |cohort|
  puts "#{cohort.to_s} cohort:"
  students.each do |student|
    puts student[:name] if student[:cohort] == cohort
  end
end
end  

def print_footer(names)
if names.count == 1
  puts "Overall, we have #{names.count} great student"
elsif names.count == 0
else
  puts "Overall, we have #{names.count} great students"
end
end

students = input_students
#call methods so code runs
print_header
print(students)
print_footer(students)