class CreateUserCountryRelations < ActiveRecord::Migration
  def self.up
    create_table :user_country_relations do |t|
      t.integer :user_id
      t.integer :country_id
      t.boolean :visited, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :user_country_relations
  end
end
