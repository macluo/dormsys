class ParkingRequest < ActiveRecord::Base

  self.primary_key = :req_no

  belongs_to :student, :class_name => 'Student', :foreign_key => :sid

end
