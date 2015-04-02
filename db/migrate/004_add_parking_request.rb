class AddParkingRequest < ActiveRecord::Migration

  def self.up
    execute "create table parking_requests (req_no int, sid CHAR(10) NOT NULL, app_status int, vehicle_type int, pref_nearby boolean, is_disabled boolean, primary key(req_no), foreign key(sid) references students(sid));"
  end

  def self.down

  end

end