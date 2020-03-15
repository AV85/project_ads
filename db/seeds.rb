# frozen_string_literal: true

require 'ffaker'

User.destroy_all
Category.destroy_all
Ad.destroy_all

User.create!(email: 'admin@email.com',
             phone: FFaker::PhoneNumberRU.international_phone_number,
             password: 'password',
             password_confirmation: 'password',
             first_name: 'John',
             last_name: 'Doe',
             role: 2)

User.create!(email: 'admin2@email.com',
             phone: FFaker::PhoneNumberRU.international_phone_number,
             password: 'password',
             password_confirmation: 'password',
             first_name: FFaker::Name.first_name,
             last_name: FFaker::Name.last_name,
             role: 2)

User.create!(email: 'user@email.com',
             phone: FFaker::PhoneNumberRU.international_phone_number,
             password: 'password',
             password_confirmation: 'password',
             first_name: FFaker::Name.first_name,
             last_name: FFaker::Name.last_name,
             role: 1)

User.create!(email: 'user2@email.com',
             phone: FFaker::PhoneNumberRU.international_phone_number,
             password: 'password',
             password_confirmation: 'password',
             first_name: FFaker::Name.first_name,
             last_name: FFaker::Name.last_name,
             role: 1)

User.create!(email: 'user3@email.com',
             phone: FFaker::PhoneNumberRU.international_phone_number,
             password: 'password',
             password_confirmation: 'password',
             first_name: FFaker::Name.first_name,
             last_name: FFaker::Name.last_name,
             role: 1)

category_atrributes = [
    { name: "Real estate", description: FFaker::Lorem.sentence, icon: "building" },
    { name: "Cars", description: FFaker::Lorem.sentence, icon: "car" },
    { name: "Tools", description: FFaker::Lorem.sentence, icon: "gears" },
    { name: "Toys", description: FFaker::Lorem.sentence, icon: "puzzle-piece" },
    { name: "Houses", description: FFaker::Lorem.sentence, icon: "home" },
    { name: "Business", description: FFaker::Lorem.sentence, icon: 'globe' },
    { name: "Animals", description: FFaker::Lorem.sentence, icon: "paw" },
    { name: "Products", description: FFaker::Lorem.sentence, icon: 'cutlery' },
    { name: "Gifts", description: FFaker::Lorem.sentence, icon: "gift" },
    { name: "Sport", description: FFaker::Lorem.sentence, icon: "futbol-o" },
]

category_atrributes.each do |attributes|
  Category.where(attributes).first_or_create
end

admin = User.find_by_email('admin@email.com')
admin2 = User.find_by_email('admin2@email.com')
user = User.find_by_email('user@email.com')
user2 = User.find_by_email('user2@email.com')
user3 = User.find_by_email('user3@email.com')

animals = Category.find_by_name('Animals')
business = Category.find_by_name('Business')
cars = Category.find_by_name('Cars')
gifts = Category.find_by_name('Gifts')
houses = Category.find_by_name('Houses')
products = Category.find_by_name('Products')
real_estate = Category.find_by_name('Real estate')
sport = Category.find_by_name('Sport')
tools = Category.find_by_name('Tools')
toys = Category.find_by_name('Toys')

ad_attributes = [
    { name: "Good house for sale in New York", description: FFaker::Lorem.paragraph, price: 100000, state: 'published', category_id: houses.id, user_id: user.id },
    { name: "New house for sale in Paris", description: FFaker::Lorem.paragraph, price: 200000, state: 'published', category_id: houses.id, user_id: user.id },
    { name: "Cool house for sale in Berlin", description: FFaker::Lorem.paragraph, price: 150000, state: 'published', category_id: houses.id, user_id: admin.id },
    { name: "Good house for sale in Moscow", description: FFaker::Lorem.paragraph, price: 50000, state: 'published', category_id: houses.id, user_id: user.id },
    { name: "New car Mercedes for sale", description: FFaker::Lorem.paragraph, price: 20000, state: 'published', category_id: cars.id, user_id: admin.id },
    { name: "New car BMW for sale", description: FFaker::Lorem.paragraph, price: 10000, state: 'published', category_id: cars.id, user_id: user.id },
    { name: "New car BMW 7 for sale", description: FFaker::Lorem.paragraph, price: 30000, state: 'published', category_id: cars.id, user_id: user2.id },
    { name: "New car BMW X5 for sale", description: FFaker::Lorem.paragraph, price: 25000, state: 'published', category_id: cars.id, user_id: user3.id },
    { name: "New car Honda for sale", description: FFaker::Lorem.paragraph, price: 10000, state: 'published', category_id: cars.id, user_id: user2.id },
    { name: "New car Ferrari for sale", description: FFaker::Lorem.paragraph, price: 100000, category_id: cars.id, user_id: user3.id },
    { name: "New car Toyota for sale", description: FFaker::Lorem.paragraph, price: 50000, category_id: cars.id, user_id: user3.id },
    { name: "Lemurs for sale", description: FFaker::Lorem.paragraph, price: 1000, state: 'published', category_id: animals.id, user_id: user.id },
    { name: "Puppies for sale", description: FFaker::Lorem.paragraph, price: 100, category_id: animals.id, user_id: user.id },
    { name: "Dog for sale", description: FFaker::Lorem.paragraph, price: 100, state: 'published', category_id: animals.id, user_id: user.id },
    { name: "Gophers for sale", description: FFaker::Lorem.paragraph, price: 2000, state: 'published', category_id: animals.id, user_id: user.id },
    { name: "Cat for sale", description: FFaker::Lorem.paragraph, price: 1000, state: 'published', category_id: animals.id, user_id: user.id }
]

ad_attributes.each do |attributes|
  Ad.where(attributes).first_or_create
end

# ad_house1 = Ad.find_by_name('Good house for sale in New York')
# ad_house2 = Ad.find_by_name('New house for sale in Paris')
# ad_house3 = Ad.find_by_name('Cool house for sale in Berlin')
# ad_house4 = Ad.find_by_name('Good house for sale in Moscow')
#
# ad_car1 = Ad.find_by_name('New car Mercedes for sale')
# ad_car2 = Ad.find_by_name('New car BMW for sale')
# ad_car3 = Ad.find_by_name('New car BMW 7 for sale')
# ad_car4 = Ad.find_by_name('New car BMW X5 for sale')
# ad_car5 = Ad.find_by_name('New car Honda for sale')
# ad_car6 = Ad.find_by_name('New car Ferrari for sale')
# ad_car7 = Ad.find_by_name('New car Toyota for sale')
#
# animal1 = Ad.find_by_name('Lemurs for sale')
# animal2 = Ad.find_by_name('Puppies for sale')
# animal3 = Ad.find_by_name('Dog for sale')
# animal4 = Ad.find_by_name('Gophers for sale')
# animal5 = Ad.find_by_name('Cat for sale')

# ad_house1.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/house_1.jpg"), filename: "house_1.jpg")
# ad_house2.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/house_2.jpg"), filename: "house_2.jpg")
# ad_house3.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/house_3.jpg"), filename: "house_3.jpg")
# ad_house4.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/house_4.jpg"), filename: "house_4.jpg")
#
# ad_car1.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/car_1.jpg"), filename: "car_1.jpg")
# ad_car2.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/car_2.jpg"), filename: "car_2.jpg")
# ad_car3.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/car_3.jpg"), filename: "car_3.jpg")
# ad_car4.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/car_4.jpg"), filename: "car_4.jpg")
# ad_car5.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/car_5.jpg"), filename: "car_5.jpg")
# ad_car6.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/car_6.jpg"), filename: "car_6.jpg")
# ad_car7.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/car_7.jpg"), filename: "car_7.jpg")
#
# animal1.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/animal_1.jpg"), filename: "animal_1.jpg")
# animal2.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/animal_2.jpg"), filename: "animal_2.jpg")
# animal3.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/animal_3.jpg"), filename: "animal_3.jpg")
# animal4.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/animal_4.jpg"), filename: "animal_4.jpg")
# animal5.images.attach(io: File.open("#{Rails.root}/app/assets/images/seed/animal_5.jpg"), filename: "animal_5.jpg")