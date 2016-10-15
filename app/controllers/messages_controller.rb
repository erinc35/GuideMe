class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    if current_guide
      message.guide = current_guide
      p message.valid?
      if message.save
        ActionCable.server.broadcast 'messages',
        message: message.body,
        guide: message.guide.first_name
        head :ok
      else
        redirect_to conversations_path
      end
    elsif current_traveler
      message.traveler = current_traveler
      if message.save
        ActionCable.server.broadcast 'messages',
        message: message.body,
        traveler: message.traveler.first_name
        head :ok
      else
        redirect_to conversations_path
      end
    else
      redirect_to conversations_path
      alert("Your not signed in to chat with a traveler or guide.")
    end


  end

  private

    def message_params
      params.require(:message).permit(:body, :conversation_id)
    end
end
