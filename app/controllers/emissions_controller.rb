class EmissionsController < ApplicationController
  def index
    @emissions = Emission.all
  end

  def new
    @emission = Emission.new
  end

  def create
    @emission = Emission.new(emission_params)
    if @emission.save
      redirect_to @emission
    else
      render :new
    end
  end

  def show
    @emission = Emission.find(params[:id])
  end

  private

  def emission_params
    params.require(:emission).permit(:file, :name)
  end
end
