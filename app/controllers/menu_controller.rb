class MenuController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
    @old_posts = Post.where(archived: true).order(created_at: :desc).offset(1)
  end

  def menu
    @old_posts = Post.where.not(id: Post.order(created_at: :desc).pluck(:id).first).order(created_at: :desc)
  end

end
