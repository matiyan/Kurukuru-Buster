class GameSystem
    def initialize 
        
        @player = Player.new( Window.width / 2, Window.height / 2, Image[:img_player] , Window.width / 2, Window.height / 2,1)
        @enemies = []
        10.times {
            @enemies << Enemy.new(rand(0, Window.width), rand(0, Window.height), Image[:img_enemy])
        }
        @bullets = []
        @time = 0   # count game-frame
        
        @score = Score.new #スコア
    end
    
    def update
        @player.change_dir  # 自機がどこを向いているか
        
        # 弾の生成(弾速はひとまず固定)        
        if @time % 60 == 0 then
            @bullets << @player.make_bullet            
        end
        
        @enemies.each{|e| e.move(@player.x, @player.y)} # 敵たちの移動
        @bullets.each{|b| b.update} #弾たちの移動
        
        if Sprite.check(@bullets,@enemies)#敵配列と弾配列の当たり判定
        @score.score += 1
        end
        #Sprite.check @bullets, @enemies   # 弾が敵を打ち落とすか
        Sprite.check @enemies, @player    # 敵が自機を打ち落とすか 
        
        # frameを数える
        @time += 1
        @time %= 60
        
        @score.update
    end
    
    # 画面描画
    def draw
        
    end
end
