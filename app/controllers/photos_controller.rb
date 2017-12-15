class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(params[:id])
    office = @photo.office
    @photo.destroy
    flash[:success] = 'Your picture has been successfully deleted'
    @photos = Photo.where(office_id: office.id)
    respond_to :js
  end
end
