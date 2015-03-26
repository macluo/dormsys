class ParkingSpot < ActiveRecord::Base

    self.primary_key = :spot_no

    belongs_to :parking_lot, :class_name => 'ParkingLot', :foreign_key => :lot_no
    belongs_to :parking_class, :class_name => 'ParkingClass', :foreign_key => :class_id
    has_many :signed_leases, :class_name => 'SignedLease'
end
