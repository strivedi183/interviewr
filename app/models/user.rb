class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :address, :phone, :image, :occupation, :lat, :long, :balance, :customer_id, :is_house
  has_many :results, :inverse_of => :user
  has_many :quizzes, :inverse_of => :user
end