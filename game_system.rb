class GameSystem
    def initialize 
        
        @player = Player.new( Window.width / 2 - 100, Window.height / 2, Image[:img_player], 10)
        @enemies = []
		@effects_enemy_bomb = Effects.new Image[:img_effect].slice_tiles(5, 1)
        @bullets = []
        @time = 0   # count game-frame

        @level = 0
        @point = 0

        @score = Score.new
    end
    
    def score
        return @score.get_score
    end
    
    def hp
        return @player.get_hp
    end
    
    def update
        @player.change_dir(@level)  # 自機がどこを向いているか
        @player.update
        
        # 弾の生成(弾速はひとまず固定)        
        if @time % (15-@level) == 0 then
            @bullets << @player.make_bullet            
        end
        
        # 敵の生成(弾速はひとまず固定)        
        if @time % (60-@point) == 0 then
            if @enemies.length <= 10 then
                @enemies << Enemy.new(0, 0, Image[:img_enemy], Time.new.sec + @time, @point)
            end
        end

        @enemies.each{|e| e.update(@player.x, @player.y) }# 敵たちの移動
        
        @bullets.each{|b| b.update } #弾たちの移動

        @flag2 = false
        #@flag2 = Sprite.check @bullets, @enemies
        @bullets.each{|b|
                if b === @enemies then
                @score.re
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
        
        if @point < 50 then
            @point = @score.get_score
        end
        
        @level = @player.get_hp
        @level = ((14 - @level)/1.5).to_i
        
        @score.update(0)
    end
    
    # 画面描画
    def draw
        Sprite.clean(@enemies,@bullets)
        Window.draw(0, 0, Image[:img_background])
    end
    
    def result
      Window.draw(0,0,Image[:img_score_background])
      @score.update(1)
    end
end
