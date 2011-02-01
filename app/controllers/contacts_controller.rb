class ContactsController < ApplicationController

  def new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    if @contact_form.deliver
      redirect_to '/' 
    else
      render :action => 'new'
    end
  end

end
