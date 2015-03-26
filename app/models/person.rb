class Person < ActiveRecord::Base


    self.inheritance_column = :ruby_type
    has_many :staffs, :class_name => 'Staff'
    has_many :students, :class_name => 'Student'
end
