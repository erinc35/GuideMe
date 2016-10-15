class MessagesController < ApplicationController

    def create
      @conversation = Conversation.find(params[:conversation_id])
      @message = @conversation.messages.build(message_params)
      if @message.save
        ActionCable.server.broadcast 'messages',
          message: @message.body,
          traveler: @message.traveler.first_name
          guide: @message.guide.first_name
        head :ok
      end
    end

    private

      def message_params
        params.require(:message).permit(:body)
      end
  end
