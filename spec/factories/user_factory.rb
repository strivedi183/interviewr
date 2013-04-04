FactoryGirl.define do
  factory :user, class: User do
    name                  'bob'
    email                 'bob@gmail.com'
    password              'a'
    password_confirmation 'a'
  end
end