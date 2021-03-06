class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_auteur!, except:[:index, :show]
  # GET /articles
  # GET /articles.json
  def index
	  @articles = Article.all.limit(1).order("created_at DESC")
    @culture = Article.where(category: [1]).limit(2).offset(1).order("created_at DESC")
    @cultures = Article.where(category: [1]).limit(2).offset(2).order("created_at DESC")
    @education = Article.where(category: [2]).limit(2).offset(1).order("created_at DESC")
    @educations = Article.where(category: [3]).limit(2).offset(2).order("created_at DESC")
    @sante = Article.where(category: [3]).limit(2).offset(1).order("created_at DESC")
    @santes = Article.where(category: [3]).limit(2).offset(2).order("created_at DESC")
    @technologie = Article.where(category: [4]).limit(2).offset(1).order("created_at DESC")
    @technologies = Article.where(category: [4]).limit(2).offset(2).order("created_at DESC")
 end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = current_auteur.articles.build
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_auteur.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:titre, :resume, :contenu, :image,  :category_id, :auteur_id)
    end
end
