include Math

class Enemy < Sprite

    def initialize(x,y,image)
        self.image= image
        @ev = 1.0 #速度
        @eh = 1.0 #体力
        @x = x
        @y = y
        
        #座標タイプA
        #@esize = 50 #大体の画像サイズ
        #@winsize = 500 #大体のウィンドウサイズ
        #if rand(0,1)==0 then #右か左
        #    @x = rand(0,1)*@winsize-@esize
        #    @y = rand(0,@wnsize)-@esize
        #else #上か下
        #    @x = rand(0,@winsize)-@esize
        #    @y = rand(0,1)*@winsize-@esize
        #end
        
        #座標タイプB
        #@x = rand(0,@winsize)
        #@y = rand(0,@winsize)
        
        #表示
        self.draw
    end
    
    def move(px,py)
        w = px - @x #cos
        h = py - @y #sin
        
        #y軸が違うとき
        if w != 0 then
            t_work = h / w #tan
            if @x < px
                rad = atan(t_work)
            else
                rad = atan(t_work) + PI
            end
        #y軸が同じとき
        elsif py < @y then
           rad = PI / 2.0
        else
            rad = -PI / 2.0
        end
        @x += (cos(rad)*@ev)
        @y += (sin(rad)*@ev)
        
        #表示
        self.draw
    end
    
    #自機に当たったとき
    def shot()
        self.vanish
    end
    
    #弾に当たったとき
    def hit()
        @eh-=1
        if @eh<=0 then
            self.vanish
        end
    end
    
end