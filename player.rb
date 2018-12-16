include Math


class Player < Sprite
    def initialize(x, y, image, hp)
        @hp = hp                    #HP
        @dir = 0                    #自機の角度(rad)
        self.image= image             #画像読み込み
        self.x = x                  #x座標
        self.y = y                  #y座標
        super(x, y, image)
        self.collision = [25,25,20] #当たり判定
    end
            
    #更新
    def update()
        self.draw
    end
    
    #角度の変更
    def change_dir()
        if self.angle < 0 
            self.angle = 360
        end
        self.angle += Input.x
        @dir = (self.angle / 180) * PI
    end
    
    #弾の生成
    def make_bullet()
        Bullet.new(Image[:img_bullet], self.x, self.y, @dir - PI / 2, 10, 1)
    end
    
    #弾の当たり判定
    def hit()
        @hp -= 1
    end
end