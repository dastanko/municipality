class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.references :attachable, :polymorphic => true

      t.timestamps
    end
    add_index :assets, [:attachable_id, :attachable_type]
  end

  def self.down
    drop_table :assets
  end
end
