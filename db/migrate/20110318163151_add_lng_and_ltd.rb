class AddLngAndLtd < ActiveRecord::Migration
  def self.up
    add_column :reports, :longtitude, :string
    add_column :reports, :latitude, :string
    remove_column :reports, :coordinates
  end

  def self.down
    add_column :reports, :coordinates, :string
    remove_column :reports, :latitude
    remove_column :reports, :longtitude
  end
end
