class AddPrimaryKeysToCountriesAndCurrencies < ActiveRecord::Migration
  def self.up
    add_column :currencies, :id, :primary_key
    add_column :countries, :id, :primary_key
  end

  def self.down
    remove_column :currencies, :id
    remove_column :countries, :id
  end
end
