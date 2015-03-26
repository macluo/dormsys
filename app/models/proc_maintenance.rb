class ProcMaintenance < ActiveRecord::Base
    self.table_name = 'proc_maintenance'


    belongs_to :maintenance_request, :class_name => 'MaintenanceRequest', :foreign_key => :ticket_no
    belongs_to :staff, :class_name => 'Staff', :foreign_key => :staff_id
end
