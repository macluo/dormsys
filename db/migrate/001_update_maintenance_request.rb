class UpdateMaintenanceRequest < ActiveRecord::Migration

  def self.up
    execute "ALTER TABLE maintenance_requests ADD (app_status int)"
  end

  def self.down

  end
end