class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    if current_guide
      message.messenger_id = current_guide.id
      message.messenger_type = current_guide.class
      if message.save
        ActionCable.server.broadcast 'messages',
        message: message.body,
        guide: message.messenger.first_name
        head :ok
      else
        redirect_to conversations_path
      end
    elsif current_traveler
      message.messenger_id = current_traveler.id
      message.messenger_type = current_traveler.class
      if message.save
        ActionCable.server.broadcast 'messages',
        message: message.body,
        traveler: message.messenger.first_name
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
