class ContactMailer < ActionMailer::Base
  default from: "coffee@rubyengineer.com"

  def contact_email(params)
    mail(content_type: "text/html", 
      to: "nino.mil@gmail.com", 
      body: params[:message],
      subject: "rubyengineer.com Contact Form - #{params[:email]} - #{params[:name]} - #{params[:subject]}"
      )
  end
end
