class AddPermalinkToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :permalink, :string, :default => ""
  end

  def self.down
    remove_column :comments, :permalink
  end
end
