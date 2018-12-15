# coding: utf-8

class Bullet < Sprite
  def initialize(kakudo = 45,hayasa = 3,fire = 1)
    self.x = (Window.width - score.width) / 2
    self.y = Window.height / 2
    self.r = kakudo #角度
    self.s = hayasa #速さ
    self.fire = fire #火力
    self.image = Image.load('images/bullet.png')#画像
  end

  def update
    self.draw
    self.x += cos(self.r) * self.s
    self.y += sin(self.r) * self.s
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