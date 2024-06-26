class Question
  attr_reader :num1, :num2

  # initialize random numbers in question from 1 to 100
  def initialize
    @num1 = rand(1..100)
    @num2 = rand(1..100)
  end

  def ask(player)
    puts "#{player.name}: what does #{num1} plus #{num2} equal?"
    print "> "
    # read user input, remove trailing newline, convert input string to integer
    gets.chomp.to_i
  end

  def correct_answer
    num1 + num2
  end
end
