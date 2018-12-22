include Math

class EnemyMovement
    def initialize seed
        @movetype = [:straight, :curve] #, :rotation]

        @type = @movetype[Random.new(seed).rand(@movetype.length)]
    end

    def move x, y, v, px, py
        case @type
        when :straight
            move_straight x, y, v, px, py
        when :curve
            move_curve x, y, v, px, py
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

    def move_straight x, y, v, px, py
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

        return x, y
    end

    def move_curve x, y, v, px, py
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
        x += (cos(rad) + cos(rad + (rand(1) == 0 ? (-1) : 1) * PI / 3.0)) * v
        y += (sin(rad) + sin(rad + (rand(1) == 0 ? (-1) : 1) * PI / 3.0)) * v

        return x, y
    end

end
