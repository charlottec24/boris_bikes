class DockingStation

	include Dockable

	def break(bike)
		bike.break!
	end

end