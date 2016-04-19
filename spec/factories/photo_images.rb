FactoryGirl.define do
  factory :photo_image, :class => 'Photo::Image' do
    file_file_name { Faker::Lorem.characters(6) }
    media_file_id 123
  end

end
