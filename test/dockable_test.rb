require 'minitest/autorun'
require '../lib/dockable'
require '../lib/bike'

class DockableModule
	include Dockable
end

class DockableTest < MiniTest::Unit::TestCase

	def setup
		@bike = Bike.new(1)
		@dockable = DockableModule.new
	end

	def test_bike_can_be_docked
		assert @dockable.empty?
		@dockable.dock(@bike)
		refute @dockable.empty?
	end
	
	def test_bike_can_be_undocked
		# Bike is in the dock
		@dockable.dock(@bike)
		# Refute empty as the dock is used (False) 
		refute @dockable.empty?
		# Undock the bike. (Deletes it from array)
		@dockable.undock(@bike)
		# Checks if empty. As the bike has been deleted, it is. (true)
		assert @dockable.empty?
	end

	def test_available_bikes
		working_bike = Bike.new(1)
		broken_bike = Bike.new(2)
		broken_bike.break!
		@dockable.dock(working_bike)
		@dockable.dock(broken_bike)
		assert_equal [working_bike], @dockable.available_bikes
	end

	def test_broken_bikes
	working_bike = Bike.new(1)
		broken_bike = Bike.new(2)
		broken_bike.break!
		@dockable.dock(working_bike)
		@dockable.dock(broken_bike)
		assert_equal [broken_bike], @dockable.broken_bikes
	end		

end