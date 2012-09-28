class Client < ActiveRecord::Base
  belongs_to :user
  attr_accessible :company_name, :contact_name, :contact_surname, :email

  def full_name
  	contact_name+' ' + contact_surname
  end

end
