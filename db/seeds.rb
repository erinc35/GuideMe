require 'faker'

Traveler.destroy_all
# Guide.destroy_all

languages = ["English", "Spanish", "German", "French", "Italian", "Portuguese", "Japanese", "Korean", "Turkish", "Mandarin", "Cantonese"]
locations = ["Chicago"]

25.times do
	travelers = Traveler.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password", phone: Faker::PhoneNumber.cell_phone, photo: Faker::Avatar.image)
end

50.times do
	guides = Guide.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password", phone: Faker::PhoneNumber.cell_phone, language: languages.sample, location: locations.sample, has_car: "yes", photo: Faker::Avatar.image)
end





# Traveler.create(first_name: "Bob", last_name: "Bob", email: "Bob@bob.com", password: "password", phone: "1234567")