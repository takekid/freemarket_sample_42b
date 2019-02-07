FactoryGirl.define do
  factory :category do
    category_name	   'chanel'
    parent_id            5
    created_at { Faker::Time.between(2.days.ago, Time.now, :all)}
  end
end