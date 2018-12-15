include Math

class Enemy < Sprite

    def initialize(ex,ey)
        @ex = ex #x座標
        @ey = ey #y座標
        @ev = 1.0 #速度
        @eh = 1.0 #体力
    end
    
    def move(px,py)
        w = px - @ex #cos
        h = py - @ey #sin
        
        #y軸が違うとき
        if w != 0 then
            t_work = h / w #tan
            if @ex < px
                rad = atan(t_work)
            else
                rad = atan(t_work) + PI
            end
        #y軸が同じとき
        elsif py < @ey then
           rad = PI / 2.0
        else
            rad = -PI / 2.0
        end
        @ex += (cos(rad)*@ev)
        @ey += (sin(rad)*@ev)
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