def input_students
    puts "Please enter the names of students and their cohorts one after the other"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    #get the first name
    name = gets.chomp
    #get the cohort
    cohort = gets.chomp.downcase.to_sym
    #while the name is not empty, repeat this code
    while !name.empty? do 
      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} students"
      #get another student name from the user
      name = gets.chomp
      cohort = gets.chomp.downcase.to_sym
      months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
      if months.include? cohort
        cohort
      end
      if cohort.empty?
        break
      end
      while !months.include? cohort do
        puts "Enter a valid cohort name (i.e. a month of the year)"
        cohort = gets.chomp.downcase.to_sym
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
  puts "Enter a letter to return names beginning with the selected letter"
  students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(75)
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