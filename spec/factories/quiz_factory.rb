# == Schema Information
#
# Table name: quizzes
#
#  id        :integer          not null, primary key
#  name      :string(255)
#  is_public :boolean
#  cost      :decimal(, )      default(0.0)
#  code      :string(255)
#  num_pass  :integer
#  user_id   :integer
#

FactoryGirl.define do
  factory :quiz, class: Quiz do
    name                  'quiz 1'
    cost                  10.00
    num_pass              7
  end
end
