require 'minitest/autorun'
require '../lib/bike'

class BikeTest < MiniTest::Test

	def setup
		@bike = Bike.new(1)
	end

	def test_new_bike_is_not_broken
		assert @bike.broken? == false
	end

	def test_bike_can_be_broken
		@bike.break!
		assert @bike.broken? == true
		10.times do |i|
			Bike.new(i)
		end
	end

	def test_bike_can_be_fixed
		@bike.break!
		@bike.fix!
		assert @bike.broken? == false
	end

end