class BoardController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to board_path(@post), notice: '投稿が作成されました。'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
