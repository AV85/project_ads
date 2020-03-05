# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ads, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  validates :email, :first_name, :last_name, presence: true
end
