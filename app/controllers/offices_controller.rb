class OfficesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_office, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @offices = current_user.offices
  end

  def show
    @reviews = @office.reviews
    return unless current_user
    @booked = Reservation.booked(@office, current_user)
    @has_review = @reviews.find_by(user_id: current_user.id)
  end

  def new
    @office = current_user.offices.build
  end

  def create
    @office = current_user.offices.build(office_params)
    if @office.save
      save_image params[:images]
      redirect_to edit_office_path(@office), notice: 'Your ad has been successfully added'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @office.update(office_params)
      save_image params[:images]
      redirect_to edit_office_path(@office), notice: 'Changes has been saved'
    else
      render :edit
    end
  end

  def destroy
    @office.destroy
    redirect_to offices_path, notice: 'Your ad has been deleted'
  end

  private

  def save_image(param)
    return unless param
    param.each do |p|
      @office.photos.create(image: p)
    end
  end

  def set_office
    @office = Office.find(params[:id])
  end

  def office_params
    params.require(:office).permit(
        :office_type,
        :privacy_type,
        :capacity,
        :boards_number,
        :meeting_room,
        :listing_name,
        :summary, :address,
        :is_wifi,
        :is_tv,
        :is_locker,
        :is_pet_friendly,
        :is_coffee,
        :is_heating,
        :is_air,
        :is_kitchen,
        :price,
        :active
    )
  end

  def require_same_user
    return unless current_user.id != @office.user_id
    flash[:danger] = 'You are not allowed to edit this page'
    redirect_to root_path
  end
end
