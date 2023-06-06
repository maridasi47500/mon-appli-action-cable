class UserAppearanceChannel < ApplicationCable::Channel
   rescue_from 'MyError', with: :deliver_error_message
  def subscribed
    stream_from "user_appearance_channel"
  end
       def receive(data)
                 ActionCable.server.broadcast("user_appearance_channel", data)
                           end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
            private
                    def deliver_error_message(e)
                              ActionCable.server.broadcast("user_appearance_channel",{sent_by:"riby",body:"error"})
                                                  end
end
