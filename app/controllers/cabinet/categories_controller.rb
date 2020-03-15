# frozen_string_literal: true

class Cabinet::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @categories = Category.order(name: :asc).page params[:page]
    @ads = Ad.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to cabinet_categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to cabinet_categories_path, notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_categories_path, notice: 'Category was successfully destroyed.' }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :icon)
  end
end
