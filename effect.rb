class Effect
	def initialize x, y, imgs
		@x = x
		@y = y
		@imgs = imgs
		@count = 0
		@count_max = imgs.length
		@finish = false
	end

	def draw
		if ( @count < @count_max ) then
			Window.draw(@x, @y, @imgs[@count])
			@count += 1
		else
			@finish = true
		end
	end

	def finish?
		return @finish
	end
end