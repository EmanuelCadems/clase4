#encoding=utf-8
class Holiday < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :description
  validates :description, :presence => true
  validates :user_id, :uniqueness => { :scope => :date, :message => "Ya fué ingresada esta fecha"}
end
