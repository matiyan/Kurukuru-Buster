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
        Window.draw_font(500,200,"LIFE:#{@hp}",Font.default, color: C_BLACK)
        self.draw
        
    end
    
    #角度の変更
    def change_dir(level)
        if self.angle < 0 
            self.angle = 360
        end
        self.angle += Input.x * (level+2)
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
    
    def get_hp
        return @hp
    end
    
end