require 'minitest/autorun'
require '../lib/dockable'
require '../lib/bike'
require '../lib/dockingstation'

class DockingStationTest < MiniTest::Test

	def setup
		@bike = Bike.new(1)
		@station = DockingStation.new
	end

    def test_record_bike_as_broken_in_docking_station
		# Dock a new bike
		@station.dock(@bike)
		# Break the new bike
		@station.break @bike
		assert @bike.broken?
		# Assert docked bike is broken
		assert_equal [@bike], @station.broken_bikes
		# assert  [broken_bikes]
	end

end