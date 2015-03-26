class HousingRequest < ActiveRecord::Base

    self.primary_key = :req_no

    belongs_to :student, :class_name => 'Student', :foreign_key => :sid
    belongs_to :parking_class, :class_name => 'ParkingClass', :foreign_key => :park_class
    belongs_to :buildings_apt, :class_name => 'BuildingsApt', :foreign_key => :building_pref_1
    belongs_to :buildings_apt, :class_name => 'BuildingsApt', :foreign_key => :building_pref_2
    belongs_to :buildings_apt, :class_name => 'BuildingsApt', :foreign_key => :building_pref_3
    belongs_to :family_apt, :class_name => 'FamilyApt', :foreign_key => :apt_pref_1
    belongs_to :family_apt, :class_name => 'FamilyApt', :foreign_key => :apt_pref_2
    belongs_to :family_apt, :class_name => 'FamilyApt', :foreign_key => :apt_pref_3
    has_many :proc_housings, :class_name => 'ProcHousing', :foreign_key => :req_no
end
