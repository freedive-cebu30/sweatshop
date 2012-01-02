class CreateEvaluations < ActiveRecord::Migration
  def self.up
    create_table :evaluations do |t|
      t.integer :company_id
      t.integer :age
      t.integer :position
      t.integer :post
      t.integer :income
      t.integer :working_hours
      t.integer :holiday_days
      t.integer :overtime_pay
      t.integer :illegality
      t.integer :interview_attitude
      t.integer :resume
      t.integer :stress_interview
      t.integer :sexual_harassment
      t.integer :interviewer_count
      t.integer :promise
      t.string :question1
      t.string :question2
      t.string :question3
      t.integer :job_type
      t.integer :enjoyment
      t.integer :learn
      t.boolean :deleted

      t.timestamps
    end
  end

  def self.down
    drop_table :evaluations
  end
end
