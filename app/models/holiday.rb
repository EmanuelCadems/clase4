class Holiday < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :description
  validates :description, :presence => true
  validates :date, :uniqueness => true
end
