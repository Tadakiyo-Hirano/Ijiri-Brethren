class AdminPages::ArticlesController < ApplicationController
  before_action :logged_in_user, only: %i(index show)
  before_action :admin_user
  before_action :set_article, only: %i(show edit update destroy)

  def index
    @articles = Article.with_attached_letter.order(issue_date: :DESC)
    @article_years = Article.with_attached_letter.order(issue_date: :DESC).group_by { |year| year.issue_date.strftime("%Y") }
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "お便りの登録が完了しました。(#{@article.issue_date.strftime("%Y/%m/%d")})"
      redirect_to admin_pages_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "お便りを更新しました。(#{@article.issue_date.strftime("%Y/%m/%d")})"
      redirect_to admin_pages_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = "お便りを削除しました。(#{@article.issue_date.strftime("%Y/%m/%d")})"
    redirect_to admin_pages_path
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:issue_date, :letter)
    end
end
