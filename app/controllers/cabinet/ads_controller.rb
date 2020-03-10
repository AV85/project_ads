class Cabinet::AdsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ad, only: %i[show edit update destroy send_to_moderator to_ban to_approve to_publish to_archive]
  load_and_authorize_resource

  def index
    if current_user.admin?
      @ads = Ad.not_draft.order(updated_at: :desc).page params[:page]
    else
      @ads = Ad.where(user_id: current_user.id).order(updated_at: :desc).page params[:page]
    end
    @categories = Category.order(name: :asc)
  end

  def show; end

  def new
    @ad = Ad.new
    @categories = Category.all
  end

  def edit; end

  def create
    @ad = Ad.new(ad_params)
    @categories = Category.all

    respond_to do |format|
      if @ad.save
        format.html { redirect_to cabinet_ads_path, notice: 'AD was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to cabinet_ads_path, notice: 'AD was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_ads_url, notice: 'AD was successfully destroyed.' }
    end
  end

  def destroy_img
    img = ActiveStorage::Attachment.find(params[:id])
    if img.purge
      redirect_and_notice
    end
  end

  def send_to_moderator
    @ad.send_to_moderator
    redirect_and_notice
  end

  def to_ban
    @ad.to_ban
    redirect_and_notice
  end

  def to_approve
    @ad.to_approve
    redirect_and_notice
  end

  def to_publish
    @ad.publish
    redirect_and_notice
  end

  def to_archive
    @ad.to_archive
    redirect_and_notice
  end

  def from_rejected_to_draft
    @ad.from_rejected_to_draft
    redirect_and_notice
  end

  def to_draft
    @ad.to_draft
    redirect_and_notice
  end

  def redirect_and_notice
    redirect_to cabinet_ads_path, notice: 'STATE was successfully updated.'
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:name, :description, :user_id, :category_id, images: [])
  end
end
