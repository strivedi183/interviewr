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

require 'spec_helper'

describe User do
  describe '.create' do
    it 'an instance of a user' do
      expect(User.new).to be_an_instance_of(User)
    end

    it 'create non-admin user' do
      u = User.create(name:'bob',email:'bob@gmail.com',password:'a',password_confirmation:'a')
      expect(u.name).to eq 'bob'
      expect(u.is_house?).to be false
    end

    it 'fails validation if email is not present' do
      user = User.create(email: 'bob@gmail.com')
      expect(user.id).to be nil
    end
  end

  context 'the user must be present' do
    let(:user) {User.create(email: 'bob@gmail.com')}

    describe '#geocoder' do
      it 'captures a lat and long' do
        user = FactoryGirl.create(:user)
        result = Geocoder.search(user.address).first
        expect(result.present?).to be true
      end
    end
  end

  describe 'relationship between users, quizzes and results' do
    describe '#quizzes' do
      it 'is a list of quizzes the user has created' do
        user = FactoryGirl.create(:user)
        quiz1 = FactoryGirl.create(:quiz)
        user.quizzes << quiz1
        expect(user.quizzes.count).to eq 1
      end
    end

    describe '#results' do
      it 'is a list of quizzes the user has taken' do
        user = FactoryGirl.create(:user)
        q1 = FactoryGirl.create(:quiz)
        r1 = FactoryGirl.create(:result)
        user.results << r1
        q1.results << r1
        expect(r1.user_id).to eq user.id
        expect(user.results.first.quiz_id).to eq q1.id
        # expect user.results to equal results where user_id is equal to user's id
      end
    end
  end

  describe '.quizzes_taken' do
    user = FactoryGirl.create(:user)
    q1 = FactoryGirl.create(:quiz)
    r1 = FactoryGirl.create(:result)
    user.results << r1
    q1.results << r1
    expect(user.quizzes_taken.first).to eq q1.id
  end


end
