class PostsController < ApplicationController
  def show
    @post = Post.published.find(params[:id])
    impressionist(@post)
  end
end
