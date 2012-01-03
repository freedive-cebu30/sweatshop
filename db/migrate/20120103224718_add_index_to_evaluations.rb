class AddIndexToEvaluations < ActiveRecord::Migration
  def self.up
    add_index :evaluations ,:company_id
  end

  def self.down
    remove_index :evaluations
  end
end
