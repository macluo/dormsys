class Person < ActiveRecord::Base

  self.table_name = "persons" # because Rails think this should be "people"
  self.primary_key = :pid

  attr_accessor :student_attributes, :staff_attributes

  has_one :staff, :class_name => 'Staff', :foreign_key => :staff_id  # changed from has_many
  has_one :student, :class_name => 'Student', :foreign_key => :sid # changed from has_many

  accepts_nested_attributes_for :student, :staff  # for constructing the object

  validates :pid, :presence => true
  validates :password, :presence => true
  validates :fname, :presence => true


  def self.authenticate(pid, password)
    person = find_by_pid(pid)
    if person && person.password == password
      person
    else
      nil
    end
  end

  def logged_in?
    true
  end

end
