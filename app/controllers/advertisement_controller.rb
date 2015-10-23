class AdvertisementController < ApplicationController
  def index
    #@advertisements = Advertisement.all
    @posts = Advertisement.all
  end

  def show
    #@advertisement = advertisement.find(params[:id])
    @post = Advertisement.find(params[:id])
  end
end
