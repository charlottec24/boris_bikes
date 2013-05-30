class Bike

	def initialize(id)
		@broken = false
		@id = id
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
	end

	def fix!
		@broken = false
	end

end