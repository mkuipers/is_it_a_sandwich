#!/usr/bin/ruby
def is_yes(val)
  ["yes", "y"].include?(val.downcase)
end

def is_no(val)
  ["no", "n"].include?(val.downcase)
end

def is_yes_or_no(val)
  is_yes(val) || is_no(val)
end

def get_answer
  response = gets.chomp!
  if (is_yes_or_no(response))
    return is_yes(response)
  else
    puts "Please respond with yes or no"
    get_answer
  end
end

def half_weight?(val)
  val ? 0.5 : 1
end

def think
  print "Thinking..."
  5.times do
    sleep(0.5)
    print "."
  end
  print "\n"
end

def max(a, b)
  a > b ? a : b
end

puts "Welcome to 'Is it a sandwich?'"
puts "Let's find out if that's a sandwich"
puts
puts "First let's talk about the bread!"
puts "Does this thing have 2 pieces of bread?"
two_pieces = get_answer
puts "Is the bread referred to as a 'bun'?"
bread_is_bun = get_answer
puts
puts "Ok now let's talk about the filling"
puts "Is it weird to eat this filling on its own with just your hands?"
filling_not_finger_food = get_answer
puts "Does the filling have more than 2g of protein?"
filling_is_protein = get_answer
puts
puts "A few more questions before we wrap this up!"
puts "Would it be strange to refer to this item as a sandwich?"
is_not_canonically_a_sandwich = get_answer
puts "Is this item considered food?"
is_not_food = get_answer
puts
puts "Great! Thank you! I will now compute the sandwich score"
think

bread_score = 0.5 * (half_weight?(!two_pieces)) * (half_weight?(bread_is_bun))
filling_score = 0.5 * (half_weight?(!filling_not_finger_food)) * (half_weight?(!filling_is_protein))
misc_penalties = (is_not_canonically_a_sandwich ? -0.3 : 0) + (is_not_food ? 0 : -0.95)
score = bread_score + filling_score + misc_penalties
puts "Your sandwich score is: #{max(score, 0) * 100}%"
