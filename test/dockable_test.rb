require 'minitest/autorun'
require '../lib/dockable'
require '../lib/bike'

class DockableModule
	include Dockable
end

class DockableTest < MiniTest::Test

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

	def test_empty_docking_station
		assert @dockable.empty?
	end

	def test_full_docking_station
		Dockable::DEFAULT_CAPACITY.times do |i|
			refute @dockable.full?
			@dockable.dock Bike.new(i)
		end
		assert @dockable.full?
	end

	def test_cant_dock_too_many_bikes
		assert_raises(RuntimeError) do
			(Dockable::DEFAULT_CAPACITY + 1).times do |i|
				@dockable.dock Bike.new(i)
			end
		end
		assert @dockable.full?
	end

	def test_count_of_bikes
		Dockable::DEFAULT_CAPACITY.times do |i|
			@dockable.dock Bike.new(i)	
		end
		assert_equal Dockable::DEFAULT_CAPACITY, @dockable.bike_count
	end

end

