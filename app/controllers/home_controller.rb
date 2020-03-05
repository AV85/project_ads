# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @categories = Category.order(name: :asc).all
    @ads = Ad.all
  end
end
