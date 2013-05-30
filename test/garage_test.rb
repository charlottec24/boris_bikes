require 'minitest/autorun'
require '../lib/dockable'
require '../lib/bike'
require '../lib/dockingstation'
require '../lib/garage'

class GarageTest < MiniTest::Test

	def setup
		@bike = Bike.new(1)
		@garage = Garage.new
	end

    def test_record_bike_as_fixed_in_garage
    	# Break the bike
    	@bike.break!
    	# Dock broken bike in Garage
    	@garage.dock(@bike)
    	# Get Garage to fix the bike
    	@garage.fix @bike
    	# Set broken? to false
    	refute @bike.broken?
    	# Check bike array against available_bikes
    	assert_equal [@bike], @garage.available_bikes

	end

end