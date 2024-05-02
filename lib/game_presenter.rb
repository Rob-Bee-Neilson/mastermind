class GamePresenter
  def initialize(engine)
    @engine = engine
  end

  def start
    puts "Welcome to Mastermind!"
    puts "Guess the secret code (made up of letters A-H) within 10 attempts."
    puts "press 'q' to quit"

    loop do
      print "Enter your guess: "
      guess = gets.chomp.upcase

      if guess == "Q"
        puts "Quiting..."
        break
      elsif
        valid_guess?(guess)
        result = @engine.check_guess(guess)
        display_result(result)
        if result == "XXXX"
          puts "success!"
          break
        end
      else
        puts "Invalid guess. Please enter a valid guess."
      end
    end
  end

  private

  def valid_guess?(guess)
    guess.match?(/^[A-H]{4}$/)
  end

  def display_result(result)
    puts "Result: #{result}"
  end
end