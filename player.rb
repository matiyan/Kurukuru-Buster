include Math

class Player < Sprite
    def initialize(hp,dir)
        @hp = hp
        @dir = dir  #radian
    end
    
    def change_dir()
        self.angle += Input.x
        @dir = (self.angle / 180) * PI
    end
    
    def make_bullet(bullet)
        bullet.d = @dir
    end
    
    def hit(enemy)
        self.check(enemy)
    end
end