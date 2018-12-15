include Math


class Player < Sprite
    def initialize(x,y,img,center_x,center_y,hp)
        @hp = hp                    #HP
        @dir = 0                    #自機の角度(rad)
        self.image= img             #画像読み込み
        self.x = x                  #x座標
        self.y = y                  #y座標
        self.center_x = center_x    #真ん中のx座標
        self.center_y = center_y    #真ん中のy座標
        super(x,y,img)
    end
            
    #更新
    def update()
        self.draw
    end
    
    #角度の変更
    def change_dir()
        self.angle += Input.x
        @dir = (self.angle / 180) * PI
    end
    
    #弾の生成
    def make_bullet()
        bullet.new(@dir,3)
    end
    
    #弾の当たり判定
    def hit()
        @hp -= 1
    end
end