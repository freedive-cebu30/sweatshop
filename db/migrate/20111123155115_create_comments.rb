class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :company_id
      t.string :name
      t.text :description
      t.boolean :deleted

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
