class ApplicationMailer < ActionMailer::Base
  default from: 'pizza-mailer@test.com'
  layout 'mailer'
end
