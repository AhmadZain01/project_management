class ManagerMailer < ApplicationMailer

  def new_user_password(id, generated_password)
    @manager = Manager.find(id)
    @generated_password = generated_password
    mail to: @manager.email, subject: "Your Login Credentials"
  end
end
