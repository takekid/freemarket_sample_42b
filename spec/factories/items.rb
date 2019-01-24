FactoryGirl.define do
  factory :item do
    name             "hello item!"
    introduction     "hoge.hoge"
    category_id      Category
    size_id          Size
    brand_id         Brand
    condition        "新品・未使用"
    shippingfee      "送料込み"
    shipfrom         "大阪府"
    shipping_date     "2~3日で発送"
    price            "30000"
    status           "販売中"
    buyer_id         0
    seller_id        1
    created_at { Faker::Time.between(2.days.ago, Time.now, :all)}
  end
end
