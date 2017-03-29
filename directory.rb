# let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter",cohort: :november},
  {name: "Darth Varer",cohort: :november},
  {name: "Nurse Ratched",cohort: :november},
  {name: "Michael Corleone",cohort: :november},
  {name: "Ales DeLarge",cohort: :november},
  {name: "The Wicked Witch of the West",cohort: :november},
  {name: "Terminator",cohort: :november},
  {name: "Freddy Krueder",cohort: :november},
  {name: "The Joker",cohort: :november},
  {name: "Joffrey Baratheon",cohort: :november},
  {name: "Norman Bates",cohort: :november}
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
