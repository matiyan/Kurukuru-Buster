class Score
  def initialize
    @score = 0 #スコア
    @font = Font.new(30)  #font
  end
  
  def update
    Window.draw_font(500,100,"score:#{@score}",@font)
  end
end