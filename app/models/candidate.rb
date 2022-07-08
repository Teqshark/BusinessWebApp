class Candidate < ApplicationRecord
  validates_presence_of :position, :name, :age, :phone_number, :address, :zip_code

  validates :zip_code, numericality: { in: 71862..72306 }

  validates :name, :length => {:maximum => 30, :too_long => '%{count} characters is the maximum allowed'
  }
  validates :position, :length => {:maximum => 30, :too_long => '%{count} characters is the maximum allowed'
  }

  validates :address, :length => 
  {:maximum => 100,
  :too_long => '%{count} characters is the maximum allowed'}

  validates :age, :length => {:is => 2}

  validates :phone_number, :length => {:is => 10}


  

  
end
