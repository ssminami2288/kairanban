class PostsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  before_action :set_posts, only: [:show, :index, :edit, :update, :destroy]
  before_action :set_post, only: [:destroy, :edit, :update]

  def index
    @meeting = Meeting.new
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      if @post.category == '回覧板'
        # 最新の投稿以外の回覧板投稿をバックナンバーに移動
        old_posts = Post.where(category: '回覧板').where.not(id: @post.id).order(created_at: :desc)
        old_posts.each do |old_post|
          old_post.update(archived: true)
        end
      end
      # リダイレクトの制御
      redirect_to post_path(@post), notice: '投稿が作成されました。'
    else
      render :new
    end
  end


  def update
    @post = Post.find(params[:id])
    
    # パラメータのログ出力
    Rails.logger.debug "Params: #{params.inspect}"
    Rails.logger.debug "Post params: #{post_params.inspect}"
  
    existing_pdfs = params[:post][:existing_pdfs].is_a?(Array) ? params[:post][:existing_pdfs] : [params[:post][:existing_pdfs]].compact
  
    if params[:post][:pdfs].blank? && existing_pdfs.present?
      if @post.update(post_params.except(:pdfs))
        @post.pdfs.attach(existing_pdfs.map { |signed_id| ActiveStorage::Blob.find_signed(signed_id) })
        redirect_to post_path(@post)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '投稿が削除されました。'
  end

  def backnumber
    # バックナンバー用の投稿を取得するロジック
    @old_posts = Post.where(archived: true, category: '回覧板').order(created_at: :desc)
  end

  def menu
    @old_posts = Post.order(created_at: :asc).where('created_at < ?', Time.now - 1.day)
  end

  

  private

  def authenticate_admin!
    # 現在のユーザーが管理人であるかどうかを確認
    return if current_user&.admin?

    flash[:alert] = '管理人のみアクセスできます。'
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:date, :title, :text, pdfs: [])
  end

  def set_posts
    @posts = Post.order(created_at: :desc)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
