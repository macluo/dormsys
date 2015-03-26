class TerminationRequest < ActiveRecord::Base

    self.primary_key = :t_req_no

    has_many :proc_terminations, :class_name => 'ProcTermination', :foreign_key => :t_req_no
    belongs_to :signed_lease, :class_name => 'SignedLease', :foreign_key => :lease_no
end
