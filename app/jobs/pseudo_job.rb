class PseudoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @pseudo=args[0]
    @user=args[1]
    ActionCable.server.broadcast("pseudo_channel", { pseudoid:@pseudo.id,pseudobody: @pseudo.body,image:@pseudo.image,username:@pseudo.name, userid: @user.id })

  end
end
