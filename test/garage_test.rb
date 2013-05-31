require 'minitest/autorun'
require '../lib/dockable'
require '../lib/bike'
require '../lib/dockingstation'
require '../lib/garage'

# class DockableModule
#     include Dockable
# end

class GarageTest < MiniTest::Test

	# include Dockable

    def setup
		#@bike = Bike.new(1)
		@garage = Garage.new
        # @dockable = DockableModule.new
	end

    def test_record_bike_as_fixed_in_garage
        # Break the bike
    	# Dock broken bike in Garage
        bikes = []
        5.times do |i|
            bike = Bike.new(i)
            bikes << bike
            bike.break!
            @garage.dock(bike)
        end 
    	# Get Garage to fix the bike
    	@garage.fix
    
        bikes.each do |bike|
            refute bike.broken?
        end
    	# Check bike array against available_bikes
    	assert_equal bikes, @garage.available_bikes

	end

end