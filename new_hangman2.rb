require 'pry'

dictionary = File.open('dictionary.txt')
dictionary_array = dictionary.readlines
dictionary_array.shuffle!

counter = 7
word = dictionary_array.pop.split(//).delete_if { |letter| letter == "\n" }.join
split_word = word.split(//)
split_word_copy = word.split(//)

p "Welcome to Hangman!"
printed_word = split_word.map {|letter| letter = "_ "}
print printed_word
puts

while counter > 0
  p "Guess Letter or Entire Word:"
  user_input = gets.chomp.downcase.strip
  until (/[a-zA-Z]/.match(user_input))
    puts "Please Enter Letter or Entire Word:"
    user_input = gets.chomp.downcase.strip
  end

  if split_word.include?(user_input)
    split_word.each_with_index do |letter, index|
     if letter == user_input
      printed_word[index] = user_input
     end
    end
  end

print printed_word
puts

if split_word_copy.include?(user_input) || user_input == word
  puts "Correct!"
  split_word_copy.delete(user_input)
else
  counter -= 1
  puts "Sorry, no #{user_input}'s!"
end

if split_word_copy.empty? || user_input == word
  puts "You Win!"
  break
end

end
