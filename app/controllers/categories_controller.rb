# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.order(name: :asc)
  end

  def show
    @categories = Category.order(name: :asc)
    @category = Category.find(params[:id])
    ads = Ad.order(updated_at: :desc).where(category_id: params[:id]).published.page params[:page]
    @q = ads.ransack(params[:q])
    @ads = @q.result(distinct: true)
  end
end
