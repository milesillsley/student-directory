# let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Varer",
  "Nurse Ratched",
  "Michael Corleone",
  "Ales DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueder",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# and then print them
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
# finally, we print the total
puts "Overall, we have #{students.count} great students"
