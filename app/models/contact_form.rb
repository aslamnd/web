class ContactForm < MailForm::Base
  @@services = [ ['Development', ['Web Application', 'Kickstart']], 
                 ['Consultancy', ['Ruby on Rails Training', 'Rescue Mission']] ]
  @@start_times = [ 'Immediately', 'Within 1 month', 'Within 3 months' ]
  @@budgets = ['Less than 10.000 EUR', '10.000 to 25.000 EUR', '25.000 EUR to 50.000 EUR', 'More than 50.000 EUR']

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

end
