class ConversationsController < ApplicationController
  def index
    @conversation = Conversation.new
    @conversations = Conversation.all
  end

  def new
    if request.referrer.split("/").last == "conversations"
      flash[:notice] = nil
    end
    @conversation = Conversation.new
  end

  def edit
    @conversation = Conversation.find_by(slug: params[:slug])
  end


def create
  @message = Message.new
  @conversation = Conversation.new(conversation_params)
  if request.xhr?
    if @conversation.save
      respond_to do |format|
        format.html { redirect_to @conversation,layout: false }
        format.js
      end
    end
  end
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
  @conversation = Conversation.find_by(slug: params[:slug])
  @message = Message.new
end

private

  def conversation_params
    params.require(:conversation).permit(:topic)
  end
end
