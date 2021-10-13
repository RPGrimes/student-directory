@students = []
require 'csv'

def input_students
  puts "Please enter the names of students and their cohorts one after the other"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp.downcase.to_sym
  while !name.empty? do 
    new_student(name, cohort)
    puts "Now we have #{@students.count} students"
    #get another student name from the user
    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp.downcase.to_sym
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
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
    "You have selected to input the students"
    input_students
  when "2"
    "You have selected show the students"
    show_students
  when "3"
    "Student list saved"
    save_students
  when "4"
    "Student list loaded"
    load_students
  when "9"
    puts "You have exited the Academy. We look forward to seeing you next time."
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

def save_students
  puts "What would you like your .csv file to be named?"
  filename = gets.chomp.downcase + ".csv"
  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  puts "#{filename}.csv saved"
  end
end

def load_students
  "Puts please enter the file name (excluding .csv)"
  filename = gets.chomp.downcase + ".csv"
  if File.exists?(filename)
    CSV.foreach(filename) do |row|
      name, cohort = row
      new_student(name, cohort)
    end
  else 
    puts "#{filename} could not be found"
  end
  puts "#{filename} loaded!"
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if CSV.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end

def new_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu