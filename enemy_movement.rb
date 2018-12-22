include Math

class EnemyMovement
    def initialize seed
        @@movetype = [:straight, :curve] #, :rotation]

        @type = @@movetype[Random.new(seed).rand(0..@@movetype.length)]
    end

    def move! x, y, v, px, py
        case @type
        when :straight
            move_straight! x, y, v, px, py
        when :curve
            move_curve! x, y, v, px, py
        end
    end

    def move_rotation x, y, v, px, py
        w = px - x #cos
        h = py - y #sin

        #y軸が違うとき
        if w != 0 then
            t_work = h / w #tan
            if x < px
                rad = atan(t_work)
            else
                rad = atan(t_work) + PI
            end
        #y軸が同じとき
        elsif py < y then
           rad = PI / 2.0
        else
            rad = -PI / 2.0
        end

        x += (cos(rad) * v)
        y += (sin(rad) * v)
    end

    def move_straight! x, y, v, px, py
        w = px - x #cos
        h = py - y #sin

        #y軸が違うとき
        if w != 0 then
            t_work = h / w #tan
            if x < px
                rad = atan(t_work)
            else
                rad = atan(t_work) + PI
            end
        #y軸が同じとき
        elsif py < y then
           rad = PI / 2.0
        else
            rad = -PI / 2.0
        end
        x += (cos(rad) * v)
        y += (sin(rad) * v)
    end

    def move_curve! x, y, v, px, py
        x += v * rand(0..10)
        y += v * rand(0..10)

        w = px - x #cos
        h = py - y #sin

        #y軸が違うとき
        if w != 0 then
            t_work = h / w #tan
            if x < px
                rad = atan(t_work)
            else
                rad = atan(t_work) + PI
            end
        #y軸が同じとき
        elsif py < y then
           rad = PI / 2.0
        else
            rad = -PI / 2.0
        end
        x += (cos(rad) * v) + cos(rad + PI / 3.0) * v * (rand(0..1) == 0 ? (-1) : 1)
        y += (sin(rad) * v) + sin(rad + PI / 3.0) * v * (rand(0..1) == 0 ? (-1) : 1)
    end

end
