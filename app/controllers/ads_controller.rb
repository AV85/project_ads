# frozen_string_literal: true

class AdsController < ApplicationController
  def index
    @ads = Ad.all
    @categories = Category.order(name: :asc).all
  end

  def show
    @ad = Ad.find(params[:id])
  end
end
