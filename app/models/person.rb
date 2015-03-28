class Person < ActiveRecord::Base

    self.primary_key = :id

    has_many :staffs, :class_name => 'Staff'
    has_many :students, :class_name => 'Student'
end
