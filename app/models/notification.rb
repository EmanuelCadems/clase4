class Notification < ActiveRecord::Base
  belongs_to :client
  belongs_to :holiday
  # attr_accessible :title, :body
end
