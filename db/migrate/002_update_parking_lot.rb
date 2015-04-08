class UpdateParkingLot < ActiveRecord::Migration

  def self.up
    execute "ALTER TABLE parking_lots MODIFY COLUMN nearby_housing varchar(20)"
    execute "ALTER TABLE parking_lots ADD FOREIGN KEY(nearby_housing) REFERENCES buildings_apts(unit_no)"
  end

  def self.down

  end
end