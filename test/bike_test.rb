require 'minitest/autorun'
require '../lib/bike'

class BikeTest < MiniTest::Test

	def test_new_bike_is_not_broken
		bike = Bike.new(1)
		assert bike.broken? == false
	end

	def test_bike_can_be_broken
		bike = Bike.new
		bike.break!
		assert bike.broken? == true
		10.times do |i|
			Bike.new(i)
		end
	end

	def test_bike_can_be_fixed
		bike = Bike.new
		bike.break!
		bike.fix!
		assert bike.broken? == false
	end

end