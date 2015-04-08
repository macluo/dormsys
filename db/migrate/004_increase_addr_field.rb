class IncreaseAddrField < ActiveRecord::Migration

  def self.up
    execute("ALTER TABLE buildings_apts modify column address varchar(100)")
  end

  def self.down

  end
end