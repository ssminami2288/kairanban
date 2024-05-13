class StampsController < ApplicationController
  before_action :authenticate_user!

  def create
    @stamp = current_user.stamps.new(stamp_params)
    if @stamp.save
      render json: { notice: 'スタンプが追加されました' }
    else
      render json: { alert: @stamp.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def stamp_params
    params.require(:stamp).permit(:post_id)
  end
end
