class Student < ActiveRecord::Base

    self.primary_key = :sid

    has_many :family_members, :class_name => 'FamilyMember', :foreign_key => :sid
    has_many :housing_requests, :class_name => 'HousingRequest', :foreign_key => :sid
    has_many :invoices, :class_name => 'Invoice', :foreign_key => :sid
    has_many :maintenance_requests, :class_name => 'MaintenanceRequest', :foreign_key => :sid
    has_many :signed_leases, :class_name => 'SignedLease', :foreign_key => :sid
    belongs_to :person, :class_name => 'Person', :foreign_key => :sid
end
