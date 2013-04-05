# == Schema Information
#
# Table name: results
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  quiz_id     :integer
#  num_correct :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  has_started :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :result, class: Result do
    num_correct                  7
  end
end
