class MeetingsController < ApplicationController
  before_action :authenticate_admin!, only: [:create]

  def new
    @meeting = Meeting.call(new)
  end

  def create
    @meeting = Meeting.new(meeting_params)
    return unless @meeting.save

    redirect_to root_path, notice: '次回の理事会の日程が設定されました。'
  end

  def show
  end

  private

  def meeting_params
    Rails.logger.debug(params.inspect)
    params.require(:meeting).permit(:date)
  end

  def authenticate_admin!
    return if current_user&.admin?

    redirect_to root_path, alert: '管理人のみアクセスできます。'
  end
end
