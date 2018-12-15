class GameSystem
    def initialize    
        @player = new Player(1, Window.width / 2, Window.height / 2, Window.width / 2, Window.height / 2)
        @enemies = []
        10.times {
            @enemies << new Enemies(rand(0, Window.width), rand(0, Window.height))
        }
        @bullets = []
        @time = 0   # count game-frame
    end
    
    def update
        @player.change_dir  # 自機がどこを向いているか

        # 弾の生成(弾速はひとまず固定)        
        if time % 60 == 0 then
            b = new Bullet
            @player.make_bullet b
            @bullets << b
        end

        @enemies.each{|e| e.move(@player.x, @palyer.y)} # 敵たちの移動
        @bullets.each{|b| b.update} #弾たちの移動
        
        Sprite.check bullets, enemies   # 弾が敵を打ち落とすか
        Sprite.check enemies, player    # 敵が自機を打ち落とすか 
        
        # frameを数える
        time += 1
        time %= 60
        
    end
    
    # 画面描画
    def draw
        
    end
end