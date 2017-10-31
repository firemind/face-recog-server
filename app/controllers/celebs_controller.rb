class CelebsController < ApplicationController
  def index
    @celebs = Celeb.all
  end

  def show
    @celeb = Celeb.find(params[:id])
  end
end
