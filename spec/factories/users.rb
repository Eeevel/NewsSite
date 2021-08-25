FactoryBot.define do
  factory :user do
    email { 'test123@test123' }
    password { '123456' }
    first_name { 'Test' }
    last_name { 'Test' }
    nickname { 'Test' }
    address { 'Belarus' }
    date_of_birth { '1970-01-01' }
    avatar { File.open('app/assets/images/default_avatar.jpg') }
    role { 'user' }
    uid { '' }
    provider { '' }
    confirmed_at { Time.now }
  end
end
