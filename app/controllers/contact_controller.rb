class ContactController < ApplicationController
  def create
    @contact_email = ContactMailer.contact_email(contact_params)

    respond_to do |format|
      if @contact_email.deliver
        format.json do
          render json: { message: "Thank you #{contact_params[:name]}! Your email is forwarded and Nino will get back to you during his next coffee break." } 
        end
      else
        format.json do 
          render json: { message: "Something went wrong!" } 
        end
      end
    end
  end

  private

    def contact_params
      params.permit(:name, :email, :subject, :message)
    end
end
