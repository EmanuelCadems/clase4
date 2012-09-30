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

  def any_holiday?  	
  	return false if days.nil?
  	self.holidays.each do |holiday|
  		if (holiday.date == (Date.today + self.days))  			  			
  			return true
  		end
  	end
  	return false
  end

  def holiday
    "#{Date.today + self.days}(" + self.holidays.where(:date => Date.today + self.days).first.description + ")"
  end

  def self.envio_masivo
    User.all.each do |user|
      if user.any_holiday?
          user.clients.each do |client|
            NewsletterMailer.weekly("#{client.email}").deliver 
          end
      end    
    end
  end

end
