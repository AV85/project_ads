# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :images
  validates :name, :description, :category_id, presence: true
end
