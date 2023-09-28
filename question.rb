class Question
  def generate
    @num1, @num2 = rand(1..20), rand(1..20)
    [@num1 + @num2, "What is #{@num1} plus #{@num2} equals?"]
  end
end
