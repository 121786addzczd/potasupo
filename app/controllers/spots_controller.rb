class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:name]
      @spots = Spot.where('name LIKE ?', "%#{params[:name]}%").order('created_at DESC')
    else
      @spots = Spot.all.order('created_at DESC')
    end
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to spot_path(@spot),notice: "投稿が完了しました"
    else
      flash.now[:alert] = '※入力項目に不備があります。確認してください※'
      render :new
    end
  end



  def show
  end

  def edit
  end

  def update
    if @spot.update(spot_params)
      redirect_to spot_path(@spot)
    else
      render :edit
    end
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to root_path
  end

  private
  def spot_params
    params.require(:spot).permit(:name, :address,  images: [])
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
