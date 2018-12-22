class Score
  def initialize
    @score = 0 #スコア
    #@font = Font.new(30)  #font
  end
  
  def get_score
    @score
  end
  
  def re
    @score += 1
  end
  
  def update
    Window.draw_font(500,100,"score:#{@score}",Font.default, color: C_BLACK)
  end
end