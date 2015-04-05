class ChangeAttrBuildingsApts < ActiveRecord::Migration

  def self.up
    #drop lease_no foreign key
    execute "ALTER TABLE rooms DROP FOREIGN KEY rooms_ibfk_2"
    execute "ALTER TABLE rooms DROP COLUMN lease_no"
    execute "ALTER TABLE family_apts DROP FOREIGN KEY family_apts_ibfk_1"
    execute "ALTER TABLE family_apts DROP COLUMN lease_no"
    execute "ALTER TABLE parking_spots DROP FOREIGN KEY parking_spots_ibfk_3"
    execute "ALTER TABLE parking_spots DROP COLUMN lease_no"

    execute "ALTER TABLE rooms add (occupant char(10)), add foreign key(occupant) references students(sid);"
    execute "ALTER TABLE family_apts add (occupant char(10)), add foreign key(occupant) references students(sid);"
    execute "ALTER TABLE parking_spots add (occupant char(10)), add foreign key(occupant) references students(sid);"

  end

  def self.down
  end

end