class ParkingClass < ActiveRecord::Base
    self.table_name = 'parking_class'
    self.primary_key = :class_id

    has_many :housing_requests, :class_name => 'HousingRequest'
    has_many :parking_spots, :class_name => 'ParkingSpot', :foreign_key => :class_id
end
