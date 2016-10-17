class MessagesController < ApplicationController
  def create
      @conversation = Conversation.find(params[:conversation_id])
      @message = @conversation.messages.build(message_params)
      @message.messenger_id = current_user.id
      @message.messenger_type = current_user.class
      @message.save!

      @path = conversation_path(@conversation)
    end

    private

    def message_params
      params.require(:message).permit(:content)
    end
  end
