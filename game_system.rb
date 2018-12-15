class GameSystem
    def initialize 
        
        @player = Player.new( Window.width / 2 - 100, Window.height / 2, Image[:img_player], 1)
        @enemies = []
                
        @bullets = []
        @time = 0   # count game-frame

        @score = Score.new
    end
    
    def update
        @player.change_dir  # 自機がどこを向いているか
        @player.update
        
        # 弾の生成(弾速はひとまず固定)        
        if @time % 30 == 0 then
            @bullets << @player.make_bullet            
        end
        
        # 敵の生成(弾速はひとまず固定)        
        if @time % 30 == 0 then
            @enemies << Enemy.new(0, 0, Image[:img_enemy], Time.new.sec + @time)            
        end

        @enemies.each{|e| 
            e.update(@player.x, @player.y)
        }# 敵たちの移動
        
        @bullets.each{|b| b.update } #弾たちの移動

        Sprite.check @bullets, @enemies   # 弾が敵を打ち落とすか

        if Sprite.check(@bullets, @enemies)#敵配列と弾配列の当たり判定
            @score.score += 1
        end
        #Sprite.check @bullets, @enemies   # 弾が敵を打ち落とすか
        Sprite.check @enemies, @player    # 敵が自機を打ち落とすか 
        
        
        # frameを数える
        @time += 1
        @time %= 60
        
        @score.update(0)
    end
    
    # 画面描画
    def draw
        Window.draw(0,0,Image[:img_background])
    end
    
    def result
      @score.update(1)
    end
end
