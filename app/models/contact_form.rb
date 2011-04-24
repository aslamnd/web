class ContactForm < MailForm::Base
  @@services = [ [:development, [:web_application, :kickstart]], 
      [:consultancy, [:training, :rescue_mission]] ]
  @@start_times = [ :immediately, :month, :months ]
  @@budgets = [:min, :medium, :high, :more]

  attribute :name,       validate: true
  attribute :email,      validate: /[^@]+@[^\.]+\.[\w\.\-]+/
  attribute :service,    validate: @@services.map { |services| services.last }.flatten
  attribute :start_time, validate: @@start_times
  attribute :budget,     validate: @@budgets
  attribute :message,    validate: true

  append :remote_ip, :user_agent, :session

  cattr_reader :services
  cattr_reader :start_times
  cattr_reader :budgets

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Codegram contact form",
      :to => "info@codegram.com",
      :from => %("Codegram Mailer <info@codegram.com>)
    }
  end

  def localized_services
    localize_array(:services, self.services)
  end

  def localized_start_times
    localize_array(:start_times, self.start_times)
  end

  def localized_budgets
    localize_array(:budgets, self.budgets)
  end

  private

  def localize_array(scope, array)
    array.collect do |e|
      if e.is_a? Array
        localize_array(scope, e)
      else
        I18n.t("#{scope}.#{e}")
      end
    end
  end

end
