class MailMessagesController < ApplicationController
  before_action :set_mail_conversation

  def create
    receipt = current_user.reply_to_conversation(@mail_conversation, params[:body])
    redirect_to mail_conversation_path(receipt.conversation)
  end

  private

  def set_mail_conversation
    @mail_conversation = current_user.mailbox.conversations.find(params[:mail_conversation_id])
  end
end
