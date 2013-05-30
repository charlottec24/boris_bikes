# Understands how to manage a set of bikes
module Dockable

	def initialize
		@bikes = []
	end

	def empty?
		@bikes.empty?
	end
	
	def dock(bike)
		@bikes << bike
	end

	def undock(bike)
		@bikes.delete(bike)
	end

	def available_bikes
		@bikes.select{|bike| !bike.broken?}
	end

	def broken_bikes
		@bikes.select{|bike| bike.broken?}
	end

	# def docked?
	# 	@docked
	# end

	# def undocked!
	# 	@docked = false
	# end

end