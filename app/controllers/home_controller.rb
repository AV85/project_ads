# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @categories = Category.all
    @ads = Ad.all
  end
end
