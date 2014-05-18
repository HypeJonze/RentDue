class Property < ActiveRecord::Base
  #####Need to add validations######
  belongs_to :user
  has_many :payments
end
