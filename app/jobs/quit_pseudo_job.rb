class QuitPseudoJob < ApplicationJob
      queue_as :default

            def perform(*args)
                                      @user=args[0]
                                                  ActionCable.server.broadcast("quit_pseudo_channel", { user:@user.id })

                                                                    end
end
