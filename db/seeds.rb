# frozen_string_literal: true

User.destroy_all
User.create!(email: 'admin@email.com',
             password: 'password',
             password_confirmation: 'password',
             first_name: 'John',
             last_name: 'Doe',
             role: 2)
