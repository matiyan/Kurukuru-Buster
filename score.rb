class Score
  def initialize
    @score = 0 #スコア
    #@font = Font.new(30)  #font
  end
  
  def update(flag)
    if flag == 0
    Window.draw_font(500,100,"score:#{@score}",Font.default, color: C_BLACK)
    end
    if flag == 1
    Window.draw_font(Window.width / 2,Window.height / 2 - 40,"score:#{@score}",Font.default, color: C_BLACK)
    end
  end
end