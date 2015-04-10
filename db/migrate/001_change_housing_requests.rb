class ChangeHousingRequests < ActiveRecord::Migration
  def self.up
    execute("ALTER TABLE housing_requests MODIFY COLUMN building_pref_1 varchar(20)")
    execute("ALTER TABLE housing_requests MODIFY COLUMN building_pref_2 varchar(20)")
    execute("ALTER TABLE housing_requests MODIFY COLUMN building_pref_3 varchar(20)")
  end

  def self.down

  end
end