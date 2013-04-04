# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  is_correct  :boolean
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :answer_is_correct, class: Answer do
    name                  'answer_1'
    is_correct            true
  end

  factory :answer_is_not_correct, class: Answer do
    name                  'bob'
    is_correct            false
  end
end
