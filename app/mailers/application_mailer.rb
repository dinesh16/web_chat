# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hello@fonix.com'
  layout 'mailer'
end
