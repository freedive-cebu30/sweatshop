class Company < ActiveRecord::Base
  has_many :comments
  has_many :evaluations
  has_many :society_evaluations
  has_many :student_evaluations
  
  validates :name,
            :presence => true,
            :uniqueness => {:scope => :address}
  validates :address, :presence => true
  validates :url ,
            :presence => true, 
            :format => URI.regexp(['http', 'https']),:allow_blank => true
  paginates_per 15
end
