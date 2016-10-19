class ConversationsController < ApplicationController
    layout false

    def create

      sender_id = params[:sender_id]
      recipient_id =  params[:recipient_id]
      sender_type = current_user.class
      recipient_type = Guide.where(id: params[:recipient_id])[0].class


      if Conversation.between(params[:sender_id],sender_type,recipient_type,params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], sender_type, recipient_type, params[:recipient_id]).first
      else
        # Add logic for when recipient is not a guide.

        @conversation = Conversation.new
        @conversation.recipient_id = recipient_id
        @conversation.sender_id = current_user.id
        @conversation.sender_type = current_user.class

        # Logic will need to go here:
        #Logc for recipient not being a guide, only starts with regards to conversations.
        #Guides do not start conversations with users, so the logic is not needed.
        @conversation.recipient_type = recipient_type
        p @conversation
        p @conversation.valid?
        @conversation.save
      end
      render json: { conversation_id: @conversation.id }
    end

    def show
      @conversation = Conversation.find(params[:id])
      @reciever = interlocutor(@conversation)
      @messages = @conversation.messages
      @message = Message.new
    end

    private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

    def interlocutor(conversation)
      current_user == conversation.recipient ? conversation.sender : conversation.recipient
    end
  end
