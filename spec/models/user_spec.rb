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
end
