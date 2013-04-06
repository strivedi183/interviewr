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
  has_secure_password
  has_many :results, :inverse_of => :user
  has_many :quizzes, :inverse_of => :user
  validates :email, :presence => true, :uniqueness => true
  validates :name, :phone, :presence => true
  mount_uploader :image, ImageUploader

  before_save :geocode

  def num_times_taken(quiz)
    self.results.where(:quiz_id => quiz.id).count
  end

  def latest_quiz(quiz)
    self.results.where(:quiz_id => quiz.id).order(:created_at).last.date
  end

  def latest_score(quiz)
    self.results.where(:quiz_id => quiz.id).order(:created_at).last.score
  end

  def average_score(quiz)
    (self.results.where(:quiz_id => quiz.id).map(&:score).reduce(:+)) / (self.results.where(:quiz_id => quiz.id).count)
  end

  def quizzes_taken
    self.results.map(&:quiz_id).map{|i| Quiz.find(i)}
  end

  def sendtxt
    if self != nil
      body = 'Congrats, ' + self.name + ' your registration is complete!'
      client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
      client.account.sms.messages.create(:from => ENV['TW_PHONE'], :to => self.phone, :body => body)
    end
  end

  def sendemail
    if self != nil
      self.name = name
      self.email = email
      Notifications.registration_message(name, email).deliver
    end
  end

  private
  def geocode
    result = Geocoder.search(self.address).first

    if result.present?
      self.lat = result.latitude
      self.long = result.longitude
    end
  end
end
