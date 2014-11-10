class ContactMailer < ActionMailer::Base
  default from: "coffee@rubyengineer.com"

  def contact_email(params)
    mail(content_type: "text/html", 
      to: params[:email], 
      body: params[:message],
      subject: "rubyengineer.com Contact Form - #{params[:name]} - #{params[:subject]}"
      )
  end
end
