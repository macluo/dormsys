class Invoice < ActiveRecord::Base

    self.primary_key = :inv_no

    belongs_to :signed_lease, :class_name => 'SignedLease', :foreign_key => :lease_no
    belongs_to :student, :class_name => 'Student', :foreign_key => :sid
end
