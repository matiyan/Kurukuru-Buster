include Math

class Enemy < Sprite
    def initialize(x,y,image, seed, point)
        r = Random.new(seed)

        @ev = r.rand(1..2) #速度
        @eh = 1.0 #体力

        if point > 30
            @ev = r.rand(1..4) #速度
        end


        #座標タイプA
        esize = 50 #大体の画像サイズ
        winsize = 500 #大体のウィンドウサイズ
        if r.rand(0..1) == 0 then #右か左
            init_x = r.rand(0..1) * winsize - esize
            init_y = r.rand(0..winsize) - esize
        else #上か下
            init_x = r.rand(0..winsize) - esize
            init_y = r.rand(0..1) * winsize - esize
        end

        #座標タイプB
        #r = Random.new(seed)
        #init_x = r.rand(0..winsize)
        #init_y = r.rand(0..winsize)

        super(init_x, init_y, image)
        self.collision = [22,23,20] #当たり判定

        @movetype = EnemyMovement.new(seed)
    end

    def update px ,py
=begin
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
=end
        @x , @y = @movetype.move @x, @y, @ev, px, py

        #表示
        self.draw
    end

    #自機に当たったとき
    def shot
        self.vanish
    end

    #弾に当たったとき
    def hit
        @eh-=1
        if @eh<=0 then
            self.vanish
        end
    end

end
