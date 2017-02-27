# passcheck.rb
# Eric Harman
# Created:  11/12/2015

def get_user_password
  puts "Welcome to the password strength checking program."
  print "Enter password: "
  password = gets.chomp
  return password
end

def count_character_types(chars)
  for i in 0..chars.length-1
    case chars[i]
      when ('a'..'z') then is_lower = true
      when ('A'..'Z') then is_upper = true
      when ('0'..'9') then is_digit = true
      when (/[^0-9A-Za-z]/) then is_special = true
      #when (' ') then is_space = true
      else puts "Unknown character type encountered"
    end
  end
  char_types = 0
  char_types +=1 if is_lower == true
  char_types +=1 if is_upper == true
  char_types +=1 if is_digit == true
  char_types +=1 if is_special == true
  return char_types
end

def check_for_space(chars)
  for i in 0..chars.length-1
    if chars[i] == ' ' then 
      is_space = true
      return is_space
    end
  end
  return is_space
end

def check_if_common(password)
  # Check to see if password among the 25 most common ********************
  common_passwords = %w[123456 password 12345 12345678 qwerty 123456789 
  1234 baseball dragon football 1234567 monkey letmein abc123 111111 
  mustang access shadow master michael superman 696969 123123 batman trustno1]
  
  downcased_password = password.downcase
  
  is_common = false
  common_passwords.each { |common_password|
    if downcased_password == common_password then
      is_common = true
      break
    end
  }
  return is_common
end

def check_if_dictionary(password)
  # Check to see if password CONTAINS a dictionary word *******************
  downcased_password = password.downcase
  is_dictionary = false
  File.foreach("dictionary.txt") do |word|
      word.chomp!
      if word.length >3
          if downcased_password.include? word
            is_dictionary = true
              #puts "***WARNING: Your password contains an English word; it may be susceptible to a dictionary attack."
              puts "  Found \"#{word}\" in your password"
              break
          end
      end
  end
  return is_dictionary
end

def compute_score(chars, char_types, is_space, is_common, is_dictionary)
  if chars.length > 100
    length_score = 25
  else
    length_score = chars.length/4.to_f
  end
  puts "\nThe length of your password is: #{chars.length} character(s)"
  puts "Your password contains #{char_types} character type(s) out of 4"
  pass_score = length_score * char_types
  puts "Your overall password score is: #{pass_score}/100"
  puts "***WARNING: Your password contains one or more spaces, which are invalid on some systems" if is_space == true
  puts "***WARNING: Your password is among the most common 25 passwords; it's highly insecure." if is_common == true
  puts "***WARNING: Your password contains an English word; it may be susceptible to a dictionary attack." if is_dictionary == true
end

# *******************

password = get_user_password

chars = password.split ""

char_types = count_character_types(chars)

is_space = check_for_space(chars)

is_common = check_if_common(password)

is_dictionary = check_if_dictionary(password)

compute_score(chars, char_types, is_space, is_common, is_dictionary)
