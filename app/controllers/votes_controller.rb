class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @votes = Vote.order("restaurantID, email, split")
    respond_with(@votes)
  end

  def show
    respond_with(@vote)
  end

  def new
    @vote = Vote.new
    respond_with(@vote)
  end

  def create
    @vote = Vote.create(vote_params)
    respond_to do |format|
      if @vote.save
        format.html { redirect_to :back}
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end	
    end

	rescue ActionController::RedirectBackError
	redirect_to root_path
  end

  private
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:restaurantID, :email, :split)
    end
end
