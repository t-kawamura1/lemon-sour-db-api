class Api::V1::LemonSoursController < ApplicationController
  before_action :set_lemon_sour, only: %i(show)

  def show
    render json: @lemon_sour, status: :ok
  end

  def index
    @lemon_sours = LemonSour.order(updated_at: :desc)
    render json: @lemon_sours, status: :ok
  end

  def search_by
    lemon_sours = LemonSour.displayed_based_on(search_sours_params)
    if lemon_sours != []
      render json: lemon_sours, status: :ok
    else
      render json: { error_message: "該当するデータがありません" }, status: :not_found
    end
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
      :sour_image,
    )
  end

  def search_sours_params
    params.permit(
      :manufacturer,
      :ingredient,
      :order,
    )
  end
end
