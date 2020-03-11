# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :images

  validates :name, :description, :category_id, presence: true

  scope :approved, -> { where(state: 'approved') }
  scope :published, -> { where(state: 'published') }
  scope :not_draft, -> { where.not(state: 'draft') }


  state_machine :initial => :draft do

    state :draft
    state :new
    state :rejected
    state :approved
    state :published
    state :archival

    event :send_to_moderator do
      transition :draft => :new
    end

    event :to_ban do
      transition :new => :rejected
    end

    event :to_approve do
      transition :new => :approved
    end

    event :publish do
      transition :approved => :published
    end

    event :to_archive do
      transition :published => :archival
    end

    event :from_rejected_to_draft do
      transition :rejected => :draft
    end

    event :to_draft do
      transition :archival => :draft
    end
  end
end
