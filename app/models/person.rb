class Person < ActiveRecord::Base

    self.primary_key = :pid

    has_many :staffs, :class_name => 'Staff'
    has_many :students, :class_name => 'Student'

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
