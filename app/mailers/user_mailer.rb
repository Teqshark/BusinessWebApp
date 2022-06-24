class UserMailer < Devise::Mailer
    helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
    default from: 'SEGURA&CO <admin@seguraconstruction.com>'
    default reply_to: 'SEGURA&CO <admin@seguraconstruction.com>'

    def welcome_email(user)
        @user = user
        @url = 'https://seguraconstruction.com'
        @loginurl = 'https://seguraconstruction.com/users/sign_in'
        mail(to: @user.email, subject: 'Welcome to Segura & Company | Poured-in-place Reinforced Concrete Retaining Walls ')
    end
end
