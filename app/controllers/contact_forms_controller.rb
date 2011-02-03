class ContactFormsController < ApplicationController

  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    if @contact_form.deliver
      flash[:notice] = 'Thank you for contacting us! Now get the fuck out of here! :)'
    end
    render :action => 'new'
  end

end
