class MailConversationsController < ApplicationController

  def index
    @mailbox_conversations = current_user.mailbox.conversations
  end

  def new
    @recipients = Guide.all - [current_user]
  end

  def create
    recipient = Guide.find(params[:guide_id])
    receipt = current_user.send_message(recipient, params[:body], params[:subject])
    redirect_to mail_conversation_path(receipt.conversation)
  end

  def show
    @mailbox_conversation = current_user.mailbox.conversations.find(params[:id])
  end
end
