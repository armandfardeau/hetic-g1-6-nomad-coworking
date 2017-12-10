class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(params[:id])
    room = @photo.room
    @photo.destroy
    flash[:success] = 'Your picture has been successfully deleted'
    @photos = Photo.where(room_id: room.id)
    respond_to :js
  end
end
