class ExpandHousingRequest < ActiveRecord::Migration

  def self.up
    execute "ALTER TABLE housing_requests add (period int, pay_option int, movein_date date)"
  end

  def self.down
  end
end