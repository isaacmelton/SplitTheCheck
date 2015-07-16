class SummariesController < ApplicationController
  before_action :set_summary, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @summaries = Summary.all
    respond_with(@summaries)
  end

  def show
    respond_with(@summary)
  end

  def new
    @summary = Summary.new
    respond_with(@summary)
  end

  def create
    @summary = Summary.new(summary_params)
  respond_to do |format|
      if @summary.save
        format.html { redirect_to restaurants_path}
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @summary.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_summary
      @summary = Summary.find(params[:id])
    end

    def summary_params
      params.require(:summary).permit(:user_id, :restaurant_id)
    end
end
