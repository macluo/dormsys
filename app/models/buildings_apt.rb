class BuildingsApt < ActiveRecord::Base

    self.primary_key = :unit_no

    has_many :housing_requests, :class_name => 'HousingRequest'
    has_many :housing_requests, :class_name => 'HousingRequest'
    has_many :housing_requests, :class_name => 'HousingRequest'
    has_many :maintenance_requests, :class_name => 'MaintenanceRequest', :foreign_key => :unit_no
    has_many :rooms, :class_name => 'Room', :foreign_key => :unit_no
    has_many :staffs, :class_name => 'Staff'
end
