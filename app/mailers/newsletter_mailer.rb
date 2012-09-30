#encoding=utf-8
class NewsletterMailer < ActionMailer::Base
  #default from: "emanuel.cadems@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.weekly.subject
  #
  def weekly(from, email, holiday)
    @holiday = holiday

    mail from: from, to: email, subject: "Notificación de Feriado desde EmanuelCadems"
  end
end
