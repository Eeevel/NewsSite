FactoryBot.define do
  factory :tag do
    name { 'test' }
    association :articles
  end
end
