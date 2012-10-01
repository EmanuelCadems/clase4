#encoding=utf-8
class Holiday < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :description
  validates :description, :presence => true
  validates :user_id, :uniqueness => { :scope => :date, :message => "Ya fué ingresada esta fecha"}

  # Devuelve una etiqueta con la fecha y descripción del feriado
  def label_holiday
  	"#{date} (#{description})"
  end

  def notify
  	self.notified = true
  	self.save #¿está bien hacer esto?
  end
end
