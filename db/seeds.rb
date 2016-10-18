require 'faker'

Traveler.destroy_all

languages = ["English", "Spanish", "German", "French", "Italian", "Portuguese", "Japanese", "Korean", "Turkish", "Mandarin", "Cantonese"]
locations = ["Hong Kong", "Las Vegas", "San Francisco", "New York", "Paris"]


25.times do
	travelers = Traveler.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password", phone: Faker::PhoneNumber.cell_phone, photo: Faker::Avatar.image("my-own-slug", "50x50"))
end

75.times do
	guides = Guide.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password", phone: Faker::PhoneNumber.cell_phone, language: languages.sample, location: locations.sample, has_car: has_car.sample, photo: Faker::Avatar.image("my-own-slug", "50x50"))
end

50.times do
	trips = Trip.create(guide_id: rand(1..50), traveler_id: rand(1..50), location: locations.sample)
end
