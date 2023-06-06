class PseudoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @pseudo=args[0]
    ActionCable.server.broadcast("pseudo_channel", { pseudoid:@pseudo.id,pseudobody: @pseudo.body,image:@pseudo.image,username:@pseudo.name })

  end
end
