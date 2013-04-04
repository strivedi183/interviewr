# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  address         :string(255)
#  phone           :string(255)
#  image           :string(255)
#  occupation      :string(255)
#  lat             :float
#  long            :float
#  balance         :decimal(, )
#  is_house        :boolean
#  customer_id     :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :address, :phone, :image, :occupation, :lat, :long, :balance, :customer_id, :is_house
  has_many :results, :inverse_of => :user
  has_many :quizzes, :inverse_of => :user
end
