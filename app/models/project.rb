class Project < ApplicationRecord
  belongs_to :user

  validates_presence_of :length, :height, :width, :zip_code, :street_name, :city, :state 
  # validates_numericality_of :length, :height, :width
  validates :zip_code, numericality: { in: 71862..72306 }
  
  validates :length, numericality: { in: 5..5000}
  validates :height, numericality: { in: 3..36 }
  validates :width, numericality: { in: 2..56}

  def full_address 
    "#{street_name} #{city} #{state} #{zip_code}"
  end
  
end
