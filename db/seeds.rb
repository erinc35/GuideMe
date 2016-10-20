require 'faker'

# Traveler.destroy_all

languages = ["English", "Spanish", "German", "French", "Italian", "Portuguese", "Japanese", "Korean", "Turkish", "Mandarin", "Cantonese"]
locations = ["Hong Kong", "Las Vegas", "San Francisco", "New York", "Paris", "Los Angeles"]
has_car = ["yes", "no"]
comments = ["Was a great guide", "Very pleasant experience", "Had a great time"]
start_dates = ["2016-10-01 00:00:00 -0500", "2016-10-05 00:00:00 -0500"]
end_dates = ["2016-10-25 00:00:00 -0500", "2016-10-30 00:00:00 -0500"]

25.times do
	travelers = Traveler.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password", phone: Faker::PhoneNumber.cell_phone, photo: Faker::Avatar.image("my-own-slug", "50x50"))
end

75.times do
	guides = Guide.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password", phone: Faker::PhoneNumber.cell_phone, language: languages.sample, location: locations.sample, has_car: has_car.sample, photo: Faker::Avatar.image("my-own-slug", "50x50"))
end

guide_array = Guide.all
guide_array.each do |guide|
	guide.available_dates << AvailableDate.create(start_date: start_dates.sample, end_date: end_dates.sample)
end

50.times do
	trips = Trip.create(guide_id: rand(1..50), traveler_id: rand(1..50), location: locations.sample, start_date: start_dates.sample, end_date: end_dates.sample)
end

100.times do
	reviews = Review.create(rating: rand(1..5), comment: comments.sample, guide_id: rand(1..50), traveler_id: rand(1..50))
end
