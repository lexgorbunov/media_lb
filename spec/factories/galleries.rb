FactoryGirl.define do
  factory :gallery do
    title { Faker::Lorem.word }
    user { build(:user) }

    trait :with_photos do
      after(:create) { |gallery| create_list(:photo, 2, gallery: gallery) }
    end
  end

end
