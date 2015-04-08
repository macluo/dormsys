class Room < ActiveRecord::Base

    self.primary_key = :unit_no, :place_no

    has_many :maintenance_requests, :class_name => 'MaintenanceRequest', :foreign_key => :place_no
    belongs_to :buildings_apt, :class_name => 'BuildingsApt', :foreign_key => :unit_no
    has_one :signed_lease, :class_name => 'SignedLease', :foreign_key => :place_no
end
