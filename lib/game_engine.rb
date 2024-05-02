class GameEngine
  attr_reader :secret_code, :attempts

  def initialize
    @secret_code = generate_secret_code
    @attempts = 10
  end

  def check_guess(guess)
    secret_code = @secret_code
    result = ""

    correct_positions = []

    secret_code.chars.each_with_index do |char, index|
      if guess[index] == char
        result += "X"
        correct_positions << index
      end
    end

    secret_code.chars.each_with_index do |char, index|
      next if correct_positions.include?(index)
      
      if guess.include?(char)
        result += "O"
      end
    end

    (secret_code.length - result.length).times { result += "-" }

    return result
  end

  private

  def generate_secret_code
    Array.new(4) { ('A'..'H').to_a.sample }.join
  end
end