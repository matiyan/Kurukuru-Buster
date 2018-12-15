include Math

class Player < Sprite
    def initialize(hp,x,y,center_x,center_y)
        @hp = hp
        @dir = 0 
        self.x = x
        self.y = y
        self.center_x = center_x
        self.center_y = center_y
    end
    x
    def change_dir()
        self.angle += Input.x
        @dir = (self.angle / 180) * PI
    end
    
    def make_bullet(bullet)
        bullet.r = @dir
    end
    
    def hit()
        @hp -= 1
    end
end