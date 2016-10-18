class MailConversationsController < ApplicationController

  def index
    @mailbox_conversations = current_user.mailbox.conversations
  end

  def show
    @mailbox_conversation = current_user.mailbox.conversations.find(params[:id])
  end
end
