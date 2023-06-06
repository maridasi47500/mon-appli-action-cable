class CommentsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    @post=Post.find args[0]
    @comment=Comment.find args[1]
    CommentsChannel.broadcast_to(@post, @comment)
  end
end
