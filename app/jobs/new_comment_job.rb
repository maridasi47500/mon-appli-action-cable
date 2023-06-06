class NewCommentJob < ApplicationJob
  queue_as :default

  def perform(*args)
    room=args[0].title
    ActionCable.server.broadcast(
        "chat_#{room}",
          {
                sent_by: 'Unknown User in '+room,
                    body: 'This is a very cool chat app.'+args[1]
          }
    )
  end
end
