# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@email.com"
  end

  sequence :custom_url do |n|
    "test#{n}"
  end
  
  factory :event do
    name "New Event"
    event_date "20140607"
    custom_url
    user
  end

  factory :photo do
    name "Image"
    event
  end

  factory :user do
    name "Courtney"
    email
    password "password"
    password_confirmation "password"
  end

end
