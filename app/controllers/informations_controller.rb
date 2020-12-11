class InformationsController < ApplicationController
  def index
    @informations = Information.all
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

  def set_information
    @information = Information.find(params[:id])
  end
end
