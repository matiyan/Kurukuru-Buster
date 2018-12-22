class GameSystem
    def initialize 
        
        @player = Player.new( Window.width / 2 - 100, Window.height / 2, Image[:img_player], 1)
        @enemies = []
		@effects_enemy_bomb = Effects.new Image[:img_effect].slice_tiles(5, 1)
		
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

        @enemies.each{|e| e.update(@player.x, @player.y) }# 敵たちの移動
        
        @bullets.each{|b| b.update } #弾たちの移動

        @flag2 = false
        #@flag2 = Sprite.check @bullets, @enemies
        @bullets.each{|b|
                if b === @enemies then
                @score.re
                #p scorehaittenai
                Window.draw_font(500,300,"true!!!!!!",Font.default, color: C_BLACK) #score:#{@score}
                end
            }

        Sprite.check @bullets, @enemies  # 弾が敵を打ち落とすか
        Sprite.check @enemies, @player    # 敵が自機を打ち落とすか
		
		#テキの爆破エフェクト管理
        @enemies.select{|e| e.vanished? }.each{|e| @effects_enemy_bomb.add e.x, e.y }
		@effects_enemy_bomb.update

		@bullets = @bullets.reject{ |b| b.nil? || b.vanished? }
		@enemies = @enemies.reject{ |e| e.nil? || e.vanished? }
        
        # frameを数える
        @time += 1
        @time %= 60
        
        @score.update(0)
    end
    
    # 画面描画
    def draw
        Sprite.clean(@enemies,@bullets)
        Window.draw(0, 0, Image[:img_background])
    end
    
    def result
      @score.update(1)
    end
end
