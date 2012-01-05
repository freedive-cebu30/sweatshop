class AddEvaluationsToThought < ActiveRecord::Migration
  def self.up
    add_column :evaluations,:thought,:text
  end

  def self.down
    remove_column :evaluations,:thought
  end
end
