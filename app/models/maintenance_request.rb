class MaintenanceRequest < ActiveRecord::Base

    self.primary_key = :ticket_no

    belongs_to :student, :class_name => 'Student', :foreign_key => :sid
    belongs_to :family_apt, :class_name => 'FamilyApt', :foreign_key => :apt_no
    belongs_to :room, :class_name => 'Room', :foreign_key => :place_no
    belongs_to :buildings_apt, :class_name => 'BuildingsApt', :foreign_key => :unit_no
    has_many :proc_maintenances, :class_name => 'ProcMaintenance', :foreign_key => :ticket_no
end
