class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @favorites = Favorite.all
    respond_with(@favorites)
  end

  def show
    respond_with(@favorite)
  end

  def new
    @favorite = Favorite.new
    respond_with(@favorite)
  end


  def create
    @favorite = Favorite.new(favorite_params)
   respond_to do |format|
      if @favorite.save
        format.html { redirect_to :back, notice: "Restaurant has been added to favorites"}
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end

	rescue ActionController::RedirectBackError
	redirect_to restaurants_path
  end

  private
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def favorite_params
      params.require(:favorite).permit(:vote, :user_id, :restaurant_id)
    end
end
