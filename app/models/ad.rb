# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, :description, presence: true
end
