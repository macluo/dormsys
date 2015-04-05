class UpdateRequestKeys < ActiveRecord::Migration

  def self.up

    execute "ALTER TABLE invoices MODIFY COLUMN inv_no INT AUTO_INCREMENT"

    # drop foreign key as in constraints name before alter primary keys to auto_increment, then add the foreign keys back
    # please note drop foreign key command for MySQL is different from PLSQL
    execute "ALTER TABLE termination_requests DROP FOREIGN KEY termination_requests_ibfk_1;"
    execute "ALTER TABLE rooms DROP FOREIGN KEY rooms_ibfk_2"
    execute "ALTER TABLE family_apts DROP FOREIGN KEY family_apts_ibfk_1"
    execute "ALTER TABLE parking_spots DROP FOREIGN KEY parking_spots_ibfk_3"
    execute "ALTER TABLE invoices DROP FOREIGN KEY invoices_ibfk_1"

    execute "ALTER TABLE signed_leases MODIFY COLUMN lease_no INT AUTO_INCREMENT"

    execute "ALTER TABLE termination_requests ADD FOREIGN KEY(lease_no) REFERENCES signed_leases(lease_no)"
    execute "ALTER TABLE rooms add foreign key(lease_no) references signed_leases(lease_no);"
    execute "ALTER TABLE family_apts add foreign key(lease_no) references signed_leases(lease_no);"
    execute "ALTER TABLE parking_spots add foreign key(lease_no) references signed_leases(lease_no);"
    execute "ALTER TABLE invoices add foreign key(lease_no) references signed_leases(lease_no)"

    execute "ALTER TABLE proc_maintenance DROP FOREIGN KEY proc_maintenance_ibfk_1"
    execute "ALTER TABLE maintenance_requests MODIFY COLUMN ticket_no INT AUTO_INCREMENT"
    execute "ALTER TABLE proc_maintenance ADD FOREIGN KEY(ticket_no) REFERENCES maintenance_requests(ticket_no)"

    execute "ALTER TABLE proc_termination DROP FOREIGN KEY proc_termination_ibfk_1"
    execute "ALTER TABLE termination_requests MODIFY COLUMN t_req_no INT AUTO_INCREMENT"
    execute "ALTER TABLE proc_termination ADD FOREIGN KEY(t_req_no) REFERENCES termination_requests(t_req_no)"

    execute "ALTER TABLE parking_requests MODIFY COLUMN req_no INT AUTO_INCREMENT"

  end

  def self.down
  end

end