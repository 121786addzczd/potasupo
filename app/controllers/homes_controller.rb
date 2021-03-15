class HomesController < ApplicationController
  def index
    @informations = Information.all.order('created_at DESC')
    @spots = Spot.order("RAND()").limit(3)
  end
end
