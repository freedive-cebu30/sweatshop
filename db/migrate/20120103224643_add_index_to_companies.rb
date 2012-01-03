class AddIndexToCompanies < ActiveRecord::Migration
  def self.up
    add_index :companies ,:name
  end

  def self.down
    remove_index companies
  end
end
