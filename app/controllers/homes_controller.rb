class HomesController < ApplicationController
  def index
    @informations = Information.all.order('created_at DESC')
  end
end
