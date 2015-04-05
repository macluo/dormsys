class FamilyApt < ActiveRecord::Base

    self.primary_key = :apt_no

    has_many :housing_requests, :class_name => 'HousingRequest'
    has_many :housing_requests, :class_name => 'HousingRequest'
    has_many :housing_requests, :class_name => 'HousingRequest'
    has_many :maintenance_requests, :class_name => 'MaintenanceRequest', :foreign_key => :apt_no
    has_one :signed_lease, :class_name => 'SignedLease', :foreign_key => :apt_no
    has_many :staffs, :class_name => 'Staff'
end
