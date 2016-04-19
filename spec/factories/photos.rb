FactoryGirl.define do
  factory :photo do
    gallery_id 0
    image { build(:photo_image) }
    link { Faker::Internet.url }

    trait :with_gallery do
      gallery { build(:gallery) }
    end
  end

end
