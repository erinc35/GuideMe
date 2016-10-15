class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = params[:user_id]
    message.traveler = params[:traveler_id]
    if message.save
      # do some stuff
    else
      redirect_to chatrooms_path
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :conversation_id)
    end
end
