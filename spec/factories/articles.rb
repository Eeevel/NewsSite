FactoryBot.define do
  factory :article do
    title { 'test' }
    short_description { 'test' }
    body { 'test' }
    news_main_image { File.open('app/assets/images/default_avatar.jpg') }
    category { 'people' }
    region { 'Belarus' }
    status { 'published' }
    important { true }
    association :user, role: 'correspondent', email: 'qwerty@qwerty'
  end
end
