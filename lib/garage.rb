class Garage

	include Dockable

	def fix#(bike)
		# bike.fix!
		@bikes.each {|bike| bike.fix! }
	end

end