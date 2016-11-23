class MailConversationsController < ApplicationController

  def index
    @mailbox_conversations = current_user.mailbox.inbox
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

  def outbox
    @mailbox_conversations = current_user.mailbox.sentbox
  end

  def trashing
    @conversations = []
    emails = params[:email]
    if emails == nil
      redirect_to mail_conversations_trash_path
    else
    emails.each do |number|
      @conversations.push(current_user.mailbox.conversations.find(number))
    end
    @conversations.each do |conversation|
       conversation.move_to_trash(current_user)
     end
    redirect_to mail_conversations_trash_path
    end
  end

  def trash
    @mailbox_conversations = current_user.mailbox.trash
  end

  def removing
    @conversations = []
    emails = params[:email]
    if emails == nil
      redirect_to mail_conversations_trash_path
    else
    emails.each do |number|
      @conversations.push(current_user.mailbox.conversations.find(number))
    end
    @conversations.each do |conversation|
       conversation.destroy
     end
    redirect_to mail_conversations_trash_path
    end
  end
end
