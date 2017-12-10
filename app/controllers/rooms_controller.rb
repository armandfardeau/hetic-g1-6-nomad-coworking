class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_room, only: [:show, :edit, :update]

  def index
    @rooms = current_user.rooms
  end

  private

  def show
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room, notice: 'Your ad has been successfully added'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect to @room, notice: 'Changes has been saved'
    else
      render :edit
    end
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(
        :home_type,
        :room_type,
        :accommodate,
        :bed_room,
        :bath_room,
        :listing_name,
        :summary, :address,
        :is_wifi,
        :is_tv,
        :is_closet,
        :is_shampoo,
        :is_breakfast,
        :is_heating,
        :is_air,
        :is_kitchen,
        :price,
        :active
    )
  end
end
