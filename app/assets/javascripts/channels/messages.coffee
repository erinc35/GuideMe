App.messages = App.cable.subscriptions.create('MessagesChannel', {

  received: (data) ->
    unless data.content.blank?
      $('#messages-table').append '<div class="message">' +
          '<div class="message-user">' + data.username + ":" + '</div>' +
          '<div class="message-content">' + data.content + '</div>' + '</div>'
});
