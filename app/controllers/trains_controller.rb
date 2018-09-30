class TrainsController < ApplicationController
  def index
    @trains = Train.all

    render json: @trains
  end

  def create
    @train = Train.new(train_params)

  end

  private
  def train_params
    params.require(:train).permit(
        :type,
        :count,
        :set,
        :menu_id
    )
  end

end
