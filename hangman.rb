##------------------Hangman-------------------------------

#---intiallizations---
word_list = %w[brad monkey dog cat koala tree hangman ruby rails]
# e.g. "brad" return random word using sample method 
word = word_list.sample

user_guess = []
word_chars = word.split('')
#['b','r','a','d'] splitting , storing in array

#hash - ( key : character , value : [indices] )
hash = Hash.new
#i to get indices
i=0 
word_chars.each { |ch|
  if hash.key?(ch)
    hash[ch].push(i)
  else
    hash[ch]=[i]
  end
  i+=1
  user_guess.push("_ ")
}

puts "\n \t Guess the word character by character \n"
attempts = word.length 
puts "\n \t You have #{attempts+1} attempts \n "
print "fill the blanks :  #{user_guess}"
#index = word_list.find_index(word)

#---game logic---
a = [] 
win = false
while attempts != 0 
  puts "\n\n\tAttempts left - #{attempts}"
  print "\n\t Guess character : "
  guess = gets.chomp
  if a.include?(guess)
    puts "\n\t...Repeated guess is not allowed...\n"
  #if character found ,replace wherever it was present 
  #e.g. word = "tree" , if user guess - e , update all indices where 'e' is present at once - ['_','_','e','e'] 
  elsif hash.key?(guess)
    index = hash[guess]
    index.each {
      |i| user_guess[i]=guess
      a.push(guess)
    }
    hash.delete(guess)
  else
    attempts -= 1
    puts "\n\t oops :(...Wrong guess !\n"
  end
  print "\n\t #{user_guess}"

  #breaking loop(set attempts=0), if player guesses all characters correct 
  if word_chars.length == a.length
    win = true
    attempts = 0
  end
end

#---Game Result---
if ! win
  puts "\n\n\t:( ...You Lost\n\n\n "
else 
  puts "\n\n\t:) ...You Won\n\n\n"
end
