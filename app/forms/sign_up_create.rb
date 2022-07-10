class SignUpCreate 
  include ActiveModel::Model 
  attr_accessor :email, :first_name, :last_name, :phone_number, :password, :zip_code, :width, :length, :height, :remember_me, :terms, :email_consent

  

# }
  # def initialize
  #   @errors = ActiveModel::Errors.new(self)
  # end
  # def initialize
  #   # @maximum_password_length = 20
  #   # @minimum_password_length = 6
  # end 


  def save 
    return false if invalid?
    ActiveRecord::Base.transaction do
      @user = User.create!(email: email, first_name: first_name, last_name: last_name, phone_number: phone_number, password: password, email_consent: email_consent, remember_me: remember_me)
      #  puts ' errors user :
      # from user 
      # errors:
      # '
      # puts @maximum_password_length
      # puts @user 
      # puts @user.errors 
      # puts @user.invalid?
      add_errors(@user.errors) if @user.invalid?

   
      # @Useruser.projects.create!(zip_code: zip_code, length: length, height: height, width: width)
      @project = Project.create(user_id: @user.id, steet_name: street_name, city: city, state: state, zip_code: zip_code, length: length, height: height, width: width) 
          #  puts @project 
      # puts @project.errors 
      # puts @project.invalid?
      
      # puts add_errors()
      # puts add_errors(@project.errors)
      
      add_errors(@project.errors) if @project.invalid?
      # puts @project.errors.details 
      # puts @project.errors.messages 

      @project.save!
    end
    
    rescue ActiveRecord::RecordInvalid => exception
      puts 'printing caught exception message'
      puts exception.message 


      puts ' errors user :
      from user 
      errors:
      '
      puts errors.details
      
      puts 'error details :'
      puts errors.details
      puts 'error full messages'
      puts errors.full_messages

      return false
    end

    private

    def add_errors(model_errors)
      model_errors.each do |error|
        attribute = error.attribute 
        message = error.message 
        errors.add(attribute, message)
      end
    end
  end

      # add_errors(@user.errors) if @user.invalid?
      
      # @user.save! 

      # @user.projects.build(user_id: @user.id, zip_code: zip_code, width: width, length: length, height: height)
      # @project = Project.create(address: address, width: width, height: height, length: length, user_id: @user.id)
      # add_errors(@project.errors) if @project.invalid? 
      # @project.save!
      # true
  #   rescue ActiveRecord::StatementInvalid => e
  #     # Handle exception that caused the transaction to fail
  #   # e.message and e.cause.message can be helpful
  #     errors.add(:base, e.message)

  #     false
  #   end
  # # rescue ActiveRecord::RecordInvalid => exception 
  # #   return false 
  # end

  # # private 
  # def add_errors(model_errors)
  #   model_errors.each do |attribute, message |
  #     errors.add(attribute, message)
  #   end
  # end

# private 
#     def  project_params 
#     params.require(:project).permit(:zip_code, :length, :height, :width )
#   end


