class User < ApplicationRecord
  #  validates :terms_of_service, acceptance: { message: 'you must agree to the terms of service' }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :projects
  accepts_nested_attributes_for :projects, limit: 10

  # validates :terms_of_service, :acceptance => true

      validates :password, :confirmation => true
      validates :password_confirmation, :presence => true
   validates :email, :length => {:maximum => 30, :too_long => '%{count} characters is the maximum allowed'
  }


validates :password, :length => { :in => 6..20 }

validates :phone_number, :length => {
  :is => 10}

  
   validates :email, :confirmation => true

   validates :email, :first_name, :last_name, :password,  :presence => true


  def full_name 
    "#{first_name} #{last_name}"
  end
  
end
