# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'




10.times do
    city = City.create!(
      name: Faker::Address.city,
      zip_code: Faker::Address.zip_code
    );
end

10.times do
    user = User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.sentence,
      email: Faker::Internet.email,
      age: rand(10..99),
      city_id: City.all.sample.id
    );
end

10.times do
    tag = Tag.create!(
      title: Faker::Name.first_name
    );
end

20.times do
    gossip = Gossip.create!(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      user_id: User.all.sample.id,
      tag_id: Tag.all.sample.id
    );
  end
  
  10.times do
    affiliation = Affiliation.create!(
      gossip_id: Gossip.all.sample.id,
      tag_id: Tag.all.sample.id
    );
  end

  50.times do
    private_messages = PrivateMessage.create!(
        content: Faker::Quote.famous_last_words,
        user_id: User.all.sample.id
    );
  end