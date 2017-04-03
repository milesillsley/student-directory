
@students = [] # an empty array accessible to all methods

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students".center(50)
  puts "2. Show the students".center(50)
  puts "3. Save the list to students.csv".center(50)
  puts "4. Load the students from students.csv".center(50)
  puts "9. Exit".center(50)
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again\n".center(50)
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # get out of the method if it isn't given
    load_students
    puts "Loaded #{@students.count} students from students.csv".center(50)
  elsif File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}".center(50)
  else # if it doesn't exists
    puts "Sorry, #{filename} doesn't exist.".center(50)
    exit # quit the program
  end
end

def input_students
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  #get the first name
  name = STDIN.gets.rstrip.split.map(&:capitalize).join(' ')
  # while the name is not empty, repeat his code
  while !name.empty? do

    puts "What cohort is #{name} part of?"
    puts "Please enter month"
    cohort = STDIN.gets.rstrip.capitalize
    cohort = "-" if cohort.empty?
    # add the student hash to the array
    add_student(name,cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student".center(50)
    else
      puts "Now we have #{@students.count} students".center(50)
    end
    # get another name from the user
    name = STDIN.gets.rstrip.split.map(&:capitalize).join(' ')
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name],student[:cohort],student[:hobbies],student[:COB],student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student(name, cohort)
  end
  file.close
end

def add_student(*args)
  name, cohort, hobbies, cob, height = *args
  @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, COB: cob, height: height}
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students_list
  if !@students.empty?
    student_list = @students.sort_by { |student| student[:cohort] }
    count = 1
    while count != student_list.length + 1
        puts "#{count}. #{student_list[count-1][:name]} (#{student_list[count-1][:cohort]} cohort)".center(50)
      count += 1
    end
  else
    puts "\n"
  end
end

def print_footer
  puts "-------------".center(50)
  puts "Overall, we have #{@students.count} great students".center(50)
  puts "\n"
end

def print_by_letter
  puts "Please choose letter to print by:".center(50)
  letter = gets.rstrip
  count = 1
  @students.each do |student|
    if student[:name].chr == letter
      puts "#{count}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
      count += 1
    end
  end
end

def print_by_name_length
  puts "Please choose maximum name character length:".center(50)
  length = gets.rstrip.to_i
  count = 1
  @students.each do |student|
    if student[:name].length <= length
      puts "#{count}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
      count += 1
    end
  end
end


#nothing happens until we call the methods
interactive_menu
