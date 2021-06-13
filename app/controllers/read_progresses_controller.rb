class ReadProgressesController < ApplicationController
  def create
    @text = Text.find(params[:text_id])
    current_user.read_progresses.create!(text_id: @text.id)
    redirect_to root_path
  end

  def destroy
    @text = Text.find(params[:text_id])
    current_user.read_progresses.find_by(text_id: @text.id).destroy!
    redirect_to root_path
  end
end
