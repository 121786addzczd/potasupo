class InformationsController < ApplicationController
  before_action :move_to_index,except: :index
  before_action :admin_user, only: [:new]
  before_action :set_information, only: [:show, :edit, :update]

  def index
    @informations = Information.all.order('created_at DESC')
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      redirect_to informations_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @information.update(information_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def information_params
    params.require(:information).permit(:title, :description, :image)
  end

  def move_to_index
    redirect_to informations_path unless user_signed_in?
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def set_information
    @information = Information.find(params[:id])
  end
end
