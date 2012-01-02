# encoding: utf-8
class SocietyEvaluation < Evaluation
  belongs_to :company
  default_scope where(:job_type => 0,:deleted => false)
  
  validates :age, :presence => true
  validates :position, :presence => true
  validates :post, :presence => true
  validates :income, :presence => true
  validates :working_hours, :presence => true
  validates :holiday_days, :presence => true
  validates :overtime_pay, :presence => true
  validates :illegality, :presence => true
  validates :interview_attitude, :presence => true
  validates :resume, :presence => true
  validates :stress_interview, :presence => true
  validates :sexual_harassment, :presence => true
  validates :interviewer_count, :presence => true
  validates :promise, :presence => true
end
