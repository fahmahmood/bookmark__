require_relative 'Bike'

class DockingStation
	attr_reader :bike 

	def initialize
		@bikes = []
	end 

	def release_bike
		fail "No bikes available" if @bikes.empty?
		@bikes.pop
	end

	def dock(bike)
		fail "No more spaces for bikes" if @bikes.count>=20
		@bikes << bike
	end 

end