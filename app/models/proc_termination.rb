class ProcTermination < ActiveRecord::Base
    self.table_name = 'proc_termination'


    belongs_to :termination_request, :class_name => 'TerminationRequest', :foreign_key => :t_req_no
    belongs_to :staff, :class_name => 'Staff', :foreign_key => :staff_id
end
