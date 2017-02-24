# passcheck.rb
# Eric Harman
# Created:  11/12/2015

# char_types = 0
# is_lower = false
# is_upper = false
# is_digit = false
# is_special = false
# is_space = false
# is_common = false

# common_passwords = %w[123456 password 12345 12345678 qwerty 123456789 
# 1234 baseball dragon football 1234567 monkey letmein abc123 111111 
# mustang access shadow master michael superman 696969 123123 batman trustno1]

# puts "Welcome to the password strength checking program."
# print "Enter password: "

# password = gets.chomp
# chars = password.split ""

# for i in 0..chars.length-1
#     case chars[i]
#         when ('a'..'z') then is_lower = true
#         when ('A'..'Z') then is_upper = true
#         when ('0'..'9') then is_digit = true
#         when (/[^0-9A-Za-z]/) then is_special = true
#         when (' ') then is_space = true
#         else puts "Unknown character type encountered"
#     end
# end

# char_types +=1 if is_lower == true
# char_types +=1 if is_upper == true
# char_types +=1 if is_digit == true
# char_types +=1 if is_special == true


# Compute password score **********************************
# if chars.length > 100
#     length_score = 25
# else
#     length_score = chars.length/4
# end

#pass_score = length_score * char_types


# puts "\nThe length of your password is: #{chars.length} character(s)"
# puts "Your password contains #{char_types} character type(s) out of 4"
# puts "Your overall password score is: #{pass_score}/100"
# puts "***WARNING: Your password contains one or more spaces, which are invalid on some systems" if is_space == true


# ***************************************************************************
# Below here not converted yet

# Check to see if password among the 25 most common ********************
# common_passwords = %w[123456 password 12345 12345678 qwerty 123456789 
# 1234 baseball dragon football 1234567 monkey letmein abc123 111111 
# mustang access shadow master michael superman 696969 123123 batman trustno1]

# downcased_password = password.downcase

# common_passwords.each { |common_password|
#     if downcased_password == common_password then
#         is_common = true
#         break
#     end
# }

# puts "***WARNING: Your password is among the most common 25 passwords; it's highly insecure." if is_common == true


# Check to see if password CONTAINS a dictionary word *******************
# File.foreach("dictionary.txt") do |word|
#     word.chomp!
#     if word.length >3
#         if downcased_password.include? word
#             puts "***WARNING: Your password contains an English word; it may be susceptible to a dictionary attack."
#             puts "  Found \"#{word}\" in your password"
#             break
#         end
#     end
# end

# ***************************************************************************
# The new way of doing things 

# Methods *****************************************************************

def get_user_password
  puts "Welcome to the password strength checking program."
  print "Enter password: "
  password = gets.chomp
  chars = password.split ""
  return chars
end

def count_character_types

  for i in 0..chars.length-1
    case chars[i]
      when ('a'..'z') then is_lower = true
      when ('A'..'Z') then is_upper = true
      when ('0'..'9') then is_digit = true
      when (/[^0-9A-Za-z]/) then is_special = true
      when (' ') then is_space = true
      else puts "Unknown character type encountered"
    end
  end

  char_types +=1 if is_lower == true
  char_types +=1 if is_upper == true
  char_types +=1 if is_digit == true
  char_types +=1 if is_special == true
  return char_types

end

def check_if_common
end

def check_if_dictionary
end

def compute_score(chars)
  if chars.length > 100
    length_score = 25
  else
    length_score = chars.length/4
  end
  puts "\nThe length of your password is: #{chars.length} character(s)"
  #puts "Your password contains #{char_types} character type(s) out of 4"
  #puts "Your overall password score is: #{pass_score}/100"
  #puts "***WARNING: Your password contains one or more spaces, which are invalid on some systems" if is_space == true
  #return score
  puts "The score is: #{length_score}"
end

# *******************

char_types = 0
is_lower = false
is_upper = false
is_digit = false
is_special = false
is_space = false
is_common = false

common_passwords = %w[123456 password 12345 12345678 qwerty 123456789 
1234 baseball dragon football 1234567 monkey letmein abc123 111111 
mustang access shadow master michael superman 696969 123123 batman trustno1]

chars = get_user_password

compute_score(chars)
