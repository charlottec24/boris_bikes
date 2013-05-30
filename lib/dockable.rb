# Understands how to manage a set of bikes
module Dockable

	DEFAULT_CAPACITY = 10

	def initialize
		@bikes = []	
	end

	def empty?
		@bikes.empty?
	end
	
	def dock(bike)
		raise "There's no room" if full?
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

	def full?
		@bikes.count >= DEFAULT_CAPACITY
	end

	def bike_count
		@bikes.count
	end

end