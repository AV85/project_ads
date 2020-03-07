# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :images
  validates :name, :description, :category_id, presence: true

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

    # before_transition :parked => any - :parked, :do => :put_on_seatbelt
    # after_transition any => :parked do |vehicle, transition|
    #   vehicle.seatbelt = 'off'
    # end
    # around_transition :benchmark
    #
    # event :ignite do
    #   transition :parked => :idling
    # end
    #
    # state :first_gear, :second_gear do
    #   validates_presence_of :seatbelt_on
    # end
    #
  end
end
