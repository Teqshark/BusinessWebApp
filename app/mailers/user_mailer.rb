class UserMailer < ApplicationMailer
    default from: 'seguraretainingwalls@gmail.com'

    def welcome_email
        @user = params[:user]
        @url = 'https://seguraconstruction.com/login'
        mail(to: @user.email, subject: 'Welcome to Segura & Company ')
    end
end
