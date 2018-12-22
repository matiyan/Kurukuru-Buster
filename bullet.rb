# coding: utf-8
include Math

class Bullet < Sprite
  def initialize(image, init_x, init_y, kakudo = PI/4, hayasa = 3,fire = 1)
    self.x = init_x + 10  #弾のずれの修正
    self.y = init_y + 10
    @r = kakudo #角度
    @s = hayasa #速さ
    @fire = fire #火力
#    self.image=(image) #画像
    
    super(self.x, self.y, image)
    self.collision = [16,16,18] #当たり判定
    @i=0
  end

  def update
    if @i>2
        self.draw
    end
    @i+=1
    self.x += cos(@r) * @s
    self.y += sin(@r) * @s
    if self.y >= 480 || self.y <= 0
      self.vanish
    end
    if self.x >= 480 || self.x <= 0
      self.vanish
    end
    
  end

  # 他のオブジェクトに衝突した際に呼ばれるメソッド
  def shot
    self.vanish
    #Window.draw_font(500,200,"hit!!",Font.default, color: C_BLACK)
  end
end