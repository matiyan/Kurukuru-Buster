include Math

class Player < Sprite
    def initialize(hp,x,y,center_x,center_y)
        @hp = hp                    #HP
        @dir = 0                    #自機の角度(rad)
        self.x = x                  #x座標
        self.y = y                  #y座標
        self.center_x = center_x    #真ん中のx座標
        self.center_y = center_y    #真ん中のy座標
    end
    
    #角度の変更
    def change_dir()
        self.angle += Input.x
        @dir = (self.angle / 180) * PI
    end
    
    #弾の生成
    def make_bullet(bullet)
        bullet.r = @dir
    end
    
    #弾の当たり判定
    def hit()
        @hp -= 1
    end
end