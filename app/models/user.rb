class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :days, :message
  
  # attr_accessible :title, :body

  has_many :holidays
  has_many :clients

  # Informa si el cliente tiene un feriado que aún no haya sido anunciado a su cliente via email
  # Devuelve:
  # * true: si el cliente tiene un feriado dentro de los días especificados en days que aún no fué notificado via email al cliente.
  # * false:
  #     ** si el cliente No tiene feriado dentro delos días especificados en days. 
  #     ** si el cliente tiene feriado dentro delos días especificados en days, pero ya fué notificado via email. 
  #     ** Si el cliente aún no especificó los días de anticipacion con los que se deberá notificar en el campo days.
  def any_holiday?  	
  	return false if days.nil?
  	self.holidays.each do |holiday|
  		if (holiday.date == (Date.today + self.days) and holiday.notified == false)  			  			
  			return true
  		end
  	end
  	return false
  end

  # Devuelve el feriado del usuario que vendrá dentro de los días especificados en days. 
  # Debido a que las fechas no se repiten dentro del calendario personal del usuario, puedo usar a la fecha como parámetro de búsqueda.
  def holiday
    # No pueden existir dos o mas feriados para un usuario con la misma fecha, por ello, el primer elemento del resultado de la búsqueda será el adecuado.
    self.holidays.where(:date => Date.today + self.days).first
  end

  def self.envio_masivo
    User.all.each do |user|
      if user.any_holiday?
          user.clients.each do |client|
            if NewsletterMailer.weekly("#{user.email}","#{client.email}","#{user.label_holiday}").deliver
              user.holiday.notify
            end
          end
      end    
    end
  end

end
