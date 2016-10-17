module MessagesHelper
  def self_or_other(message)
    message.messenger == current_user ? "self" : "other"
  end

  def message_interlocutor(message)
    message.messenger == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end
end
