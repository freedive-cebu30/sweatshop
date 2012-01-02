class StudentEvaluation < Evaluation
  belongs_to :company
  default_scope where(:job_type => 1,:deleted => false)
  
  validates :age, :presence => true
  validates :illegality, :presence => true
  validates :interview_attitude, :presence => true
  validates :resume, :presence => true
  validates :stress_interview, :presence => true
  validates :sexual_harassment, :presence => true
  validates :promise, :presence => true
end
