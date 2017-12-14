class ApplicationMailer < ActionMailer::Base
  default from: "#{ENV['HEROKU_APP_NAME']} <no-reply@#{ENV['HEROKU_APP_NAME']}.com>"
  layout 'mailer'
end
