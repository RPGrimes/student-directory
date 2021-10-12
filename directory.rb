@students = []

def input_students
  puts "Please enter the names of students and their cohorts one after the other"
  puts "To finish, just hit return twice"
  #get the first name
  name = gets.chomp
  #get the cohort
  cohort = gets.chomp.downcase.to_sym
  #while the name is not empty, repeat this code
  while !name.empty? do 
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} students"
    #get another student name from the user
    name = gets.chomp
    cohort = gets.chomp.downcase.to_sym
    months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
    if cohort.empty?
      break
    end
    if months.include? cohort
      cohort
    end
    while !months.include? cohort do
      puts "Enter a valid cohort name (i.e. a month of the year)"
      cohort = gets.chomp.downcase.to_sym
    end
  end
end

def interactive_menu
  loop do
    #1. print the menu and ask the user what to do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    "Invalid input, please enter a valid option from the menu"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "_____________"
end

def print_students_list
  #print students group by cohort
  if !@students.empty?
    @students
  else
    puts "There are no students attending the academy :("
  end

  cohorts = @students.map do |student|
    student[:cohort]
  end 
  cohorts.uniq.each do |cohort|
    puts "#{cohort.to_s} cohort:"
    @students.each do |student|
      puts student[:name] if student[:cohort] == cohort
    end
  end
end  

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  elsif @students.count == 0
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

interactive_menu