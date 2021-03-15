class HomesController < ApplicationController
  def index
    @informations = Information.all.order('created_at DESC')
    @spots = Spot.all.order('created_at DESC').limit(3)
  end
end
