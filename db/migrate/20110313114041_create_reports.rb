class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer :state_id
      t.integer :user_id
      t.integer :category_id
      t.string :subject
      t.text :description
      t.string :coordinates
      t.string :pincolor
      t.string :address
      t.boolean :solved, :default => false
      t.boolean :approved, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
