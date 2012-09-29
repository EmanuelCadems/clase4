class Client < ActiveRecord::Base
  belongs_to :user
  attr_accessible :company_name, :contact_name, :contact_surname, :email
  validates :email, :uniqueness => true, :presence => true
  validates :contact_name, :presence => true

  def full_name
  	contact_name+' ' + contact_surname
  end

  
end
