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
    return true if @attempted_chars.include?(char)
    return false
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |chr, i|
      arr << i if chr == char
    end
    arr
  end

  def fill_indices(char, indices)
  indices.each do |i|
    @guess_word[i] = char
  end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts 'that has already been attempted'  
      return false
    end

      @attempted_chars << char
      chars = self.get_matching_indices(char)
      if chars.empty?
        @remaining_incorrect_guesses -= 1
      else
        self.fill_indices(char, chars)
      end
      return true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    input = gets.chomp
    return try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts 'WIN'
      return true
    else
      return false
  end
end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else
      return false
    end
  end

end
