# coding: utf-8

class Bullet < Sprite
  def initialize(kakudo = 45,hayasa = 3)
    self.x = (Window.width - score.width) / 2
    self.y = Window.height / 2
    self.r = kakudo#角度
    self.s = hayasa#速さ
  end

  def update
    self.x += cos(self.r) * self.s
    self.y += sin(self.r) * self.s
    if self.y >= Window.height || self.y <= 0
      self.vanish
    end
    if self.x >= Window.width || self.x <= 0
      self.vanish
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def shot
    self.vanish
  end
end