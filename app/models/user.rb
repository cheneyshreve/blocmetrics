class User < ApplicationRecord
  has_many :registered_applications
  
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
