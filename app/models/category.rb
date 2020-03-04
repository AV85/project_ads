# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :ads
  validates :name, :description, presence: true
end
