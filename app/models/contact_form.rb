class ContactForm < MailForm::Base
  @@budgets = ['Less than 10.000 EUR', '10.000 to 25.000 EUR', '25.000 EUR to 50.000 EUR', 'More than 50.000 EUR']
  @@start_times = [ 'Immediately', 'Within 1 month', 'Within 3 months' ]

  attribute :name,       validate: true
  attribute :email,      validate: /[^@]+@[^\.]+\.[\w\.\-]+/
  attribute :budget,     validate: @@budgets
  attribute :start_time, validate: @@start_times
  attribute :message

  cattr_reader :budgets
  cattr_reader :start_times

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Codegram contact form",
      :to => "info@codegram.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end
