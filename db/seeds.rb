# frozen_string_literal: true

User.destroy_all
Category.destroy_all
User.create!(email: 'admin@email.com',
             password: 'password',
             password_confirmation: 'password',
             first_name: 'John',
             last_name: 'Doe',
             role: 2)

category_atrributes = [
    { name: "Real estate", description: "In this area adds about " },
    { name: "Cars", description: "In this area adds about cars" },
    { name: "Tools", description: "In this area adds about tools" },
    { name: "Toys", description: "In this area adds about toys " },
    { name: "Houses", description: "In this area adds about houses" },
    { name: "Business", description: "In this area adds about business" },
    { name: "Animals", description: "In this area adds about animals" },
    { name: "Products", description: "In this area adds about products" },
    { name: "Gifts", description: "In this area adds about gifts" },
    { name: "Sport", description: "In this area adds about sport" },
]

category_atrributes.each do |attributes|
  Category.where(attributes).first_or_create
end

user = User.find_by_email('admin@email.com')
category = Category.find_by_name('Business')

ad_atrributes = [
    { name: "Need Real estate", description: "In this area adds about real estate", category_id: category.id, user_id: user.id },
    { name: "Sell Cars", description: "In this area adds about cars", category_id: category.id, user_id: user.id },
    { name: "Sell Tools", description: "In this area adds about tools", category_id: category.id, user_id: user.id },
    { name: "Sell Toys", description: "In this area adds about toys ", category_id: category.id, user_id: user.id },
    { name: "Sell Houses", description: "In this area adds about houses", category_id: category.id, user_id: user.id },
    { name: "Need Business", description: "In this area adds about business", category_id: category.id, user_id: user.id },
    { name: "Sell Animals", description: "In this area adds about animals", category_id: category.id, user_id: user.id },
    { name: "Sell Products", description: "In this area adds about products", category_id: category.id, user_id: user.id },
    { name: "Sell Gifts", description: "In this area adds about gifts", category_id: category.id, user_id: user.id },
    { name: "Sell Sport", description: "In this area adds about sport", category_id: category.id, user_id: user.id },
]

ad_atrributes.each do |attributes|
  Ad.where(attributes).first_or_create
end