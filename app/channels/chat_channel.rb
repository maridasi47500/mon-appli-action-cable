class ChatChannel < ApplicationCable::Channel
  rescue_from 'MyError', with: :deliver_error_message

  def subscribed
    stream_from "chat_#{params[:room]}"
  end
  def receive(data)
        ActionCable.server.broadcast("chat_#{params[:room]}", data)
          end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
    private
        def deliver_error_message(e)
          ActionCable.server.broadcast("chat_#{params[:room]}",{sent_by:"riby",body:"error"})
                    end

end
