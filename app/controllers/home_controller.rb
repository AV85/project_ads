# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @categories = Category.order(name: :asc)
    @ads = Ad.order(updated_at: :desc).published.page params[:page]
  end
end
