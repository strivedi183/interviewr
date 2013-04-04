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
  let(:user) {User.create(name: 'Bob', email: 'bob@gmail.com', password:'1234', password_confirmation: '1234')}

  describe '.create' do
    it 'creates a user' do

    end
  end
end
