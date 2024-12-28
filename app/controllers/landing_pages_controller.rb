class LandingPagesController < ApplicationController
  skip_before_action :require_login

  def automation_service
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to automation_service_path, notice: "Contacto creado correctamente"
    else
      render :automation_service
    end
  end
end

