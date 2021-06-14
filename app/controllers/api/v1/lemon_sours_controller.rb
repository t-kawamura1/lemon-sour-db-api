class Api::V1::LemonSoursController < ApplicationController
  before_action :set_lemon_sour, only: [:show]

  def show
    render json: {
      status: 200,
      data: @lemon_sour,
    }
  end

  def index
    lemon_sours = LemonSour.order(updated_at: :desc)
    render json: {
      status: 200,
      data: lemon_sours,
    }
  end

  private

  def set_lemon_sour
    @lemon_sour = LemonSour.find(params[:id])
  end

  def lemon_sour_params
    params.require(:lemon_sour).permit(
      :name,
      :manufacturer,
      :calories,
      :alcohol_content,
      :pure_alcohol,
      :fruit_juice,
      :zero_sugar,
      :zero_sweetener,
    )
  end
end