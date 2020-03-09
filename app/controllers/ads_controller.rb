# frozen_string_literal: true

class AdsController < ApplicationController
  def index
    @ads = Ad.order(updated_at: :desc).published
  end

  def show
    @ad = Ad.find(params[:id])
  end
end
