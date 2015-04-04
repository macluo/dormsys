class AddAttrBuildingsApts < ActiveRecord::Migration

  def self.up
    execute "ALTER TABLE buildings_apts add (upper_class_only boolean);"

    execute "ALTER TABLE rooms add (lease_no int), add foreign key(lease_no) references signed_leases(lease_no);"

    execute "ALTER TABLE family_apts add (lease_no int), add foreign key(lease_no) references signed_leases(lease_no);"

    execute "ALTER TABLE parking_spots add (lease_no int), add foreign key(lease_no) references signed_leases(lease_no);"

  end

  def self.down
  end

end