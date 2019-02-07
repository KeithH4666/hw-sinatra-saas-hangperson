class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word 
  attr_accessor :guesses 
  attr_accessor :wrong_guesses 
  attr_accessor :word_with_guesses 
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @word_with_guesses = ''
    @guess = ''
    
    for i in 1..word.length do
      @word_with_guesses.concat('-')
    end
  end
  
  # Method for guessing a letter
  def guess(letter)
    
    raise ArgumentError if letter.nil? ## Raise an error if the letter is null.
    raise ArgumentError if letter == '' ## Raise an error if the user entered an empty string. 
    raise ArgumentError if !letter.match(/[a-zA-Z]/) ## Raise an error is the user entered a letter that is not in the alphabet.

    
    letter.downcase!
    
    # If word includes letter
    if(word.include? letter)
      # And the letter isnt already in guess
      unless (guesses.include? letter)
      # Add guessed word to guesses
      guesses.concat(letter)
      return true # return true valid guess
      end #end unless
    return false  # invalid guess false
    else
      unless (wrong_guesses.include? letter)
        # Add the guessed letter to the list of incorrected guesses
        wrong_guesses.concat(letter)
        return true
      end # end unless
    return false # invalid guess
    end # end for 
  end
  
  

  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

end
