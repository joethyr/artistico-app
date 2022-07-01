class ApplicationController < ActionController::Base
  private

  def set_user_picture
    @picture = Picture.find(params[:picture_id])
  end

end
