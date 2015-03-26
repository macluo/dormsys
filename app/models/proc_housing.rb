class ProcHousing < ActiveRecord::Base
    self.table_name = 'proc_housing'


    belongs_to :housing_request, :class_name => 'HousingRequest', :foreign_key => :req_no
    belongs_to :staff, :class_name => 'Staff', :foreign_key => :staff_id
end
