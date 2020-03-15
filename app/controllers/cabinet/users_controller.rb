# frozen_string_literal: true

class Cabinet::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @users = if current_user.admin?
               User.order(updated_at: :desc).page params[:page]
             else
               User.where(id: current_user.id).order(updated_at: :desc).page params[:page]
             end
    @categories = Category.order(name: :asc)
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to cabinet_users_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to cabinet_user_url, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :role, :avatar)
  end
end
