class Staff < ActiveRecord::Base

    self.primary_key = :staff_id

    has_many :proc_housings, :class_name => 'ProcHousing', :foreign_key => :staff_id
    has_many :proc_maintenances, :class_name => 'ProcMaintenance', :foreign_key => :staff_id
    has_many :proc_terminations, :class_name => 'ProcTermination', :foreign_key => :staff_id
    belongs_to :person, :class_name => 'Person', :foreign_key => :staff_id
    belongs_to :buildings_apt, :class_name => 'BuildingsApt', :foreign_key => :works_in_building
    belongs_to :family_apt, :class_name => 'FamilyApt', :foreign_key => :works_in_apt
end
