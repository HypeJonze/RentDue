class User < ActiveRecord::Base
  #if user deleted his/her account properties also deleted from database
  has_many :properties , dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #####Need to add validations######
end
