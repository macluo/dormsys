class FamilyMember < ActiveRecord::Base



    belongs_to :student, :class_name => 'Student', :foreign_key => :sid
end
