#encoding=utf-8
class NewsletterMailer < ActionMailer::Base
  default from: "emanuel.cadems@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.weekly.subject
  #
  def weekly(email)
    @greeting = "Hi"

    mail to: "to@example.org", subject: "Notificación de Feriado desde EmanuelCadems"
  end
end
