class ConversationsController < ApplicationController

def create
  @conversation = Conversation.new(conversation_params)
  if @conversation.save
    respond_to do |format|
      format.html { redirect_to @conversation }
      format.js
    end
  else
    respond_to do |format|
      flash[:notice] = {error: ["Guide is not online."]}
      format.html { redirect_to :back }
    end
  end
end

def show
  @chatroom = Chatroom.find_by(slug: params[:slug])
  @message = Message.new
end

private

  def conversation_params
    params.require(:chatroom).permit(:topic)
  end
end
