@points = {
 'a' => 1,
 'b' => 4,
 'c' => 4,
 'd' => 2,
 'e' => 1,
 'f' => 3,
 'g' => 3,
 'h' => 3,
 'i' => 1,
 'j' => 8,
 'k' => 5,
 'l' => 2,
 'm' => 4,
 'n' => 2,
 'o' => 1,
 'p' => 4,
 'q' => 10,
 'r' => 1,
 's' => 1,
 't' => 1,
 'u' => 2,
 'v' => 5,
 'w' => 4,
 'x' => 8,
 'y' => 3,
 'z' => 10
}

def prompt()
  print "> "
end

def get_points(word, bonus_position, bonus_type)
  points = 0
  splitword = word.split(//)
    for position in 0...splitword.length
      if bonus_position == position && (bonus_type == "dl" || bonus_type == "tl")
        case bonus_type
        when "dl"
          points += (@points[splitword[position]]*2)
        when "tl"
          points += (@points[splitword[position]]*3)
        end
      else
        points += @points[splitword[position]]
      end
    end
    if (bonus_type == "dw" || bonus_type == "tw") && bonus_position < word.length 
      points *= 2 if bonus_type == "dw"
      points *= 3 if bonus_type == "tw"
    end
  return points
end
    
def wordlist(no_of_letters, letters, bonus_position, bonus_type)
  time_at_start = Time.new
  @f = File.read('twl.txt').split
  @dictionary_length = @f.length
  @total = 0
  @possible_words = []
  letters_string = "#{letters.to_s}"
    
  for word in @f
    if word.length <= no_of_letters
      if check_letters(word, letters, 0)
      end
    end
  end
  
  time_at_end = Time.new
  
  puts 
  puts "---------------------------------------------"
  puts "             Possible words"
  puts "---------------------------------------------"
  
  @possible_words.sort!{|x,y| get_points(x, bonus_position, bonus_type).to_i <=> get_points(y, bonus_position, bonus_type).to_i}
  for i in 1..@possible_words.length
    puts " #{i}: #{@possible_words[i-1].to_s} : #{get_points(@possible_words[i-1], bonus_position, bonus_type).to_s} points."
  end
  
  puts "---------------------------------------------"
  puts "Total words up to length #{no_of_letters} that include the letters '#{letters_string}': #{@total}"
  puts "Check Letters function ran #{@check_letters_run_times} times."
  time_taken = time_at_end - time_at_start
  puts "Time taken: #{time_taken} seconds."
  puts "(Dictionary has #{@dictionary_length} entries.)"
  puts
  return nil
end

@check_letters_run_times = 0

def check_letters(word, letters, position)
  if position < word.length && letters.length != 0
    @check_letters_run_times += 1
    word_letter = word[position]
    # puts "Word is: #{word}, position is: #{position}, letter is #{word_letter}. match letters are: #{letters}"
    if word[position] =~ /[#{letters}]/
      letters.sub!(word_letter, "")
      if letters.length == 0 || (position+1) == word.length
        # puts "Possible word: #{word}"
        @possible_words << word
        @total += 1
        end
      if check_letters(word, letters, (position+1))
        return true
      else
        letters << word_letter
      end
    end
  end
  return false
end
  
puts "Show words of up to how many letters?"
prompt; number = gets.chomp.to_i()
puts "Input letters:"
prompt; letters = gets.chomp
puts "What bonus (dl, tw etc.) ?"
prompt; bonus_type = gets.chomp
puts "Bonus position (0 based):"
prompt; bonus_position = gets.chomp.to_i

wordlist(number, letters, bonus_position, bonus_type)
  