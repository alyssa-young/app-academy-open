class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end
  def guess_word
    @guess_word
  end
  def attempted_chars
    @attempted_chars
  end
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
  def already_attempted?(char)
    if attempted_chars.include?(char)
      return true
    end
    false
  end
  def get_matching_indices(char)
    my_arr = []
    @secret_word.each_char.with_index do |ch, i|
      if char == ch
        my_arr << i
      end
    end
    my_arr
  end
  def fill_indices(char, arr)
    arr.each {|i| @guess_word[i] = char}
  end
  def try_guess(char)
    attempted = already_attempted?(char)
    if attempted 
      puts 'that has already been attempted'
      return false
    else
      if get_matching_indices(char).length == 0
        @remaining_incorrect_guesses -= 1
      end
      @attempted_chars << char
      fill_indices(char, get_matching_indices(char))
    end
    true
  end
  def ask_user_for_guess
    puts 'Enter a char:'
    guess = gets.chomp
    try_guess(guess)
  end
  def win?
    if @guess_word.join("") == @secret_word
      print 'WIN'
      return true
    end
    false
  end
  def lose?
    if  @remaining_incorrect_guesses == 0
      print 'LOSE'
      return true
    end
    false
  end
  def game_over?
    if win? || lose?
      print @secret_word
      return true
    end
    false
  end
end

:)
