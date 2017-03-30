def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  #get the first name
  name = gets.chomp
  # while the name is not empty, repeat his code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 1
  students.each do |student|
    puts "#{count}.#{student[:name]} (#{student[:cohort]} cohort)"
    count += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_by_letter(students)
  puts "Please choose letter to print by:"
  letter = gets.chomp
  count = 1
  students.each do |student|
    if student[:name].chr == letter
      puts "#{count}.#{student[:name]} (#{student[:cohort]} cohort)"
    end
    count += 1
  end
end

def print_by_name_length(students)
  puts "Please choose maximum name character length:"
  length = gets.chomp.to_i
  count = 1
  students.each do |student|
    if student[:name].length <= length
      puts "#{count}.#{student[:name]} (#{student[:cohort]} cohort)"
    end
    count =+ 1
  end
end



#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
print_by_letter(students)
print_by_name_length(students)
