class ChangeRoomsKey < ActiveRecord::Migration

  def self.up
    #drop lease_no foreign key

    execute "ALTER TABLE signed_leases DROP FOREIGN KEY signed_leases_ibfk_3"
    execute "ALTER TABLE maintenance_requests DROP FOREIGN KEY maintenance_requests_ibfk_3"
    execute "ALTER TABLE rooms DROP PRIMARY KEY"
    execute "ALTER TABLE rooms ADD PRIMARY KEY (place_no, unit_no)"
    execute "ALTER TABLE signed_leases ADD (unit_no varchar(20)), ADD FOREIGN KEY (unit_no) REFERENCES rooms(unit_no)"
    execute "ALTER TABLE signed_leases ADD FOREIGN KEY (place_no) REFERENCES rooms(place_no)"
    execute "ALTER TABLE maintenance_requests ADD FOREIGN KEY (place_no) REFERENCES rooms(place_no)"

  end

  def self.down
  end

end