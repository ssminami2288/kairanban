class AccessController < ApplicationController
  def new
    @post = Post.new
    @posts = Post.order(created_at: :desc)
  end
end
