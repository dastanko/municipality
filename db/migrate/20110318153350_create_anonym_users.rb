class CreateAnonymUsers < ActiveRecord::Migration
  def self.up
    create_table :anonym_users do |t|
      t.string :email
      t.string :name
      t.string :last_name
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :anonym_users
  end
end
