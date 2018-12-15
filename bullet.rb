# coding: utf-8
include Math

class Bullet < Sprite
  def initialize(image, init_x, init_y, kakudo = PI/4, hayasa = 3,fire = 1)
    self.x = init_x    #- score.width
    self.y = init_y
    @r = kakudo #角度
    @s = hayasa #速さ
    @fire = fire #火力
    self.image=(image) #画像
  end

  def update
    self.draw
    self.x += cos(@r) * @s
    self.y += sin(@r) * @s
    if self.y >= Window.height || self.y <= 0
      self.vanish
    end
    if self.x >= Window.width || self.x <= 0
      self.vanish
    end
    
  end

  # 他のオブジェクトに衝突した際に呼ばれるメソッド
  def shot
    self.vanish
  end
end