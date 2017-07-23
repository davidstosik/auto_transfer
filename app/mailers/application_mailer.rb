class ApplicationMailer < ActionMailer::Base
  default from: Rails.configuration.x.owner_email
  layout 'mailer'
end
