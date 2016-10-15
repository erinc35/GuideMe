# class MessagesController < ApplicationController
#
#   def create
#     message = Message.new(message_params)
#     if current_guide
#       message.guide = current_guide
#       message.traveler =
#     elsif current_traveler
#       message.guide =
#       message.traveler = current_traveler
#     else
#       redirect_to conversations_path
#       alert("Your not signed in to chat with a traveler or guide.")
#     end
#
#     if message.save
#       ActionCable.server.broadcast 'messages',
#       message: message.body,
#       guide: message.guide.first_name
#       traveler: message.traveler.first_name
#       head :ok
#     else
#       redirect_to conversations_path
#     end
#   end
#
#   private
#
#     def message_params
#       params.require(:message).permit(:content, :conversation_id)
#     end
# end
