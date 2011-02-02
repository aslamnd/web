class ContactForm < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /[^@]+@[^\.]+\.[\w\.\-]+/
  #attribute :file,      :attachment => true

  #attribute :budget,      :validate => true
  attribute :message
  #attribute :nickname,  :captcha  => true

  cattr_reader :budgets
  @@budgets = [
    'Less than 5.000eur'
  ]

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
