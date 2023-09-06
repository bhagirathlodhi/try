class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(object)
    @object = object
    @object_count = object.class.count

    mail to: 'bhagi.lodhi8989@gmail.com', subject: "A new entry for #{object.class} has been created"
  end
end
