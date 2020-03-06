# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.order(name: :asc).all
  end

  def show
    @categories = Category.order(name: :asc).all
    @category = Category.find(params[:id])
  end
end