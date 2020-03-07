# frozen_string_literal: true

class AdsController < ApplicationController
  def index
    @ads = Ad.order(updated_at: :desc)
    @categories = Category.order(name: :asc).all
  end

  def show
    @ad = Ad.find(params[:id])
  end
end
