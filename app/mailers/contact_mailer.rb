class ContactMailer < ActionMailer::Base
  default from: "coffee@rubyengineer.com"

  DEFAULT_TO = "nino.mil@gmail.com"

  def contact_email(params)
    @name     = params[:name]
    @email    = params[:email]
    @subject  = params[:subject]
    @body     = params[:message]

    mail to: DEFAULT_TO, subject: "rubyengineer.com ★ Contact Form"
  end
end
