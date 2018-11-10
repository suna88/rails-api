class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :destroy]

  def index
    @menus = Menu.all
    render json: @menus
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      render json: @menu, status: :created
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @menu.destroy

    render json: {result: 'ok'}
  end

  def show
    render json: {menu: @menu, trains: @menu.trains}
  end

  private
  def menu_params
    params.require(:menu).permit(
        :name,
        :user_id,
        :start_date,
        :finish_date,
        trains_attributes: [:type, :count, :set, :menu_id])
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end
end
