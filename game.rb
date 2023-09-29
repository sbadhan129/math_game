class Game
  def initialize
    @players = [Player.new('Player1'), Player.new('Player2')]
    @current_index = 0
  end

  def current_player
    @players[@current_index]
  end

  def switch_player
    @current_index ^= 1
  end

  def player
    question_instance = Question.new
    while @players[0].lives > 0 && @players[1].lives > 0
      answer, question = question_instance.generate
      puts "#{current_player.name}: #{question}"
      user_answer = gets.chomp.to_i

      if user_answer == answer
        puts "#{current_player.name}: Your answer is absolutely correct."
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.lose_life
      end
      
      puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
      puts "NEW TURN" unless current_player.lives.zero?
      switch_player
    end

    winner = @players[0].lives > 0 ? @players[0] : @players[1]
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "- - GAME OVER - -"
    puts "Good bye!"
    puts "Thank you for playing."
  end
end