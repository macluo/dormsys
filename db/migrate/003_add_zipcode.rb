class AddZipcode < ActiveRecord::Migration

  def self.up
    execute("ALTER TABLE persons ADD column zipcode char(10)")
  end

  def self.down

  end
end