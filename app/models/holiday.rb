class Holiday < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :description
end
