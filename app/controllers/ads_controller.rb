# frozen_string_literal: true

class AdsController < ApplicationController
  def index
    ads = Ad.order(updated_at: :desc).published.page params[:page]
    @q = ads.ransack(params[:q])
    @ads = @q.result(distinct: true)
  end

  def show
    @ad = Ad.find(params[:id])
  end
end
