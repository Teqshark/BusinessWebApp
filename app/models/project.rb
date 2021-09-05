class Project < ApplicationRecord
  belongs_to :user

  validates_presence_of :length, :height, :width, :zip_code
  # validates_numericality_of :length, :height, :width
  validates :zip_code, numericality: { in: 71862..72306 }

  validates :length, numericality: { in: 5..5000}
  validates :height, numericality: { in: 3..36 }
  validates :width, numericality: { in: 2..56}

  # :zip_code, :length, :height, :width,
end
