class GalleriesController < ApplicationController
  def show
    @entry = Gallery.published.find(params[:id])

    respond_to do |f|
      f.html
    end
  end
end
