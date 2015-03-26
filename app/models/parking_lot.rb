class ParkingLot < ActiveRecord::Base

    self.primary_key = :lot_no

    has_many :parking_spots, :class_name => 'ParkingSpot', :foreign_key => :lot_no
end
