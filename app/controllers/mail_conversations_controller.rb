class MailConversationsController < ApplicationController

  def index
    @mailbox_conversations = current_user.mailbox.conversations
  end

  def new
    @recipients = Guide.where.not("id = ?", current_user.id)
  end

  def create
    recipient = Guide.find(params[:guide_id])
    receipt = current_user.send_message(recipient, params[:body], params[:subject])

    if params[:body] == "" && params[:subject] == ""
      @errors = ["Your message is missing a subject!", "Your message is missing a body!" ]
      render 'new'
    elsif params[:body] == ""
      @errors = ["Your message is missing a body!"]
      render 'new'
    elsif params[:subject] == ""
      @errors = ["Your message is missing a subject!"]
      render 'new'
    else
      redirect_to mail_conversation_path(receipt.conversation)
    end
  end

  def show
    @mailbox_conversation = current_user.mailbox.conversations.find(params[:id])
  end
end
