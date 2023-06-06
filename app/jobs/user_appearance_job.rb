class UserAppearanceJob < ApplicationJob
    queue_as :default

      def perform(*args)
            @pseudo=args[0]
            @user=args[1]
            ActionCable.server.broadcast("user_appearance_channel", { pseudoid:@pseudo.id,pseudobody: @pseudo.body,image:@pseudo.image,username:@pseudo.name,userid:@user.id })

                  end
end
