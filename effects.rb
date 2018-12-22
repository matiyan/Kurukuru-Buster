class Effects
	def initialize imgs
		@items = []
		@imgs = imgs
	end

	def add x, y
		@items << Effect.new(x, y, @imgs)
	end
	
	def update
		@items.each{|i| i.draw}

		@items = @items.reject{|i| i.finish?}
	end
end
