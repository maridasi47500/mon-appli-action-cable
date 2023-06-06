class ChatJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ActionCable.server.broadcast("chat_#{args[0].title}", { sent_by:args[1]+" de #{args[0].title}",body: args[2] })

  end
end
