require 'faker'

Traveler.destroy_all

5.times do
	Traveler.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password", phone: Faker::PhoneNumber.cell_phone, photo: Faker::Avatar.image)
end

# first_name: Bob, last_name: Bob, email: Bob@bob.com, password: "password", password_confirmation: "password", phone: Faker::PhoneNumber.cell_phone