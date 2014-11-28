class ContactMailer < ActionMailer::Base
  default from: "coffee@rubyengineer.com"

  DEFAULT_TO = "coffee@rubyengineer.com"

  def contact_email(params)
    @name     = params[:name]
    @email    = params[:email]
    @subject  = params[:subject]
    @body     = params[:message]
    @title    = "rubyengineer.com ● Contact Form"

    mail to: DEFAULT_TO, subject: @title
  end
end
