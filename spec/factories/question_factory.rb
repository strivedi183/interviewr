# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  prompt     :string(255)
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :question, class: Question do
    prompt                  'this is question 1'
  end
end
