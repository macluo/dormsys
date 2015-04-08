class UpdateRooms < ActiveRecord::Migration

  def self.up
    execute("ALTER TABLE buildings_apts DROP COLUMN apt_no")
    execute("ALTER TABLE rooms ADD COLUMN apt_no varchar(10)")
  end

  def self.down

  end
end