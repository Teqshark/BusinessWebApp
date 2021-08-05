class Project < ApplicationRecord
  belongs_to :user
  validates_presence_of :length :height :width 
  validates_numericality_of :lenght :height :width
end
