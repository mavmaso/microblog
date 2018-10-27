class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: 'Artigo criado'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: 'Artigo atualizado'
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Apagado com sucesso'
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end