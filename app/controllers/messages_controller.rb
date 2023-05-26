class MessagesController < ApplicationController
  def create
    @room = Room.find(message_params[:room_id])
    @message = @room.messages.new(message_params)
    @message.user = current_user
    @message.save
  end

  private
    def message_params
      params.require(:message).permit(:room_id, :user_id, :content)
    end
end