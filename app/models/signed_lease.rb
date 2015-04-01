class SignedLease < ActiveRecord::Base

    self.primary_key = :lease_no

    has_many :invoices, :class_name => 'Invoice', :foreign_key => :lease_no
    belongs_to :student, :class_name => 'Student', :foreign_key => :sid
    belongs_to :parking_spot, :class_name => 'ParkingSpot', :foreign_key => :parking_spot
    belongs_to :room, :class_name => 'Room', :foreign_key => :place_no
    belongs_to :family_apt, :class_name => 'FamilyApt', :foreign_key => :apt_no
    has_many :termination_requests, :class_name => 'TerminationRequest', :foreign_key => :lease_no

    def self.getCurrentLease(sid)
        lease = find_by_sid(sid)
      if lease
        lease
      else
        nil
      end
    end
end
