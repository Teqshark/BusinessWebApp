class User < ApplicationRecord
  #  validates :terms_of_service, acceptance: { message: 'you must agree to the terms of service' }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :projects
  def full_name 
    "#{first_name} #{last_name}"
  end
  
end
