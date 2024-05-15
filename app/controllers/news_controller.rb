class NewsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news_posts = News.all
  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
    @posts = Post.where(category: '回覧板').order(created_at: :desc)
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to posts_path(@news), notice: 'ニュースが作成されました。'
    else
      render :new
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      redirect_to @news, notice: 'ニュースが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to news_index_path, notice: 'ニュースが削除されました。'
  end

  private

  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:date, :title, :text, pdfs: [], images: [])
  end
end
