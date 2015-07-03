class ArticlesController < ApplicationController
  before_action :is_user?
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_position

  # GET /articles
  # GET /articles.json
  def index
    if params[:sub_category_id].blank?
      params[:sub_category_id] = 10
    end
    @articles = Article.where(:sub_category_id=>params[:sub_category_id]).page params[:page]
  end

  def list
    @articles = Article.page(params[:page])
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article.update_attribute(:click, @article.click.to_i+1)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.click = 0
    respond_to do |format|
      if @article.save
        format.html { redirect_to list_articles_path, notice: 'Article was successfully created.' }
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
        format.html { redirect_to list_articles_path, notice: 'Article was successfully updated.' }
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
      format.html { redirect_to list_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text, :sub_category_id, :source)
    end
    def set_position
      @sub_categories = SubCategory.where(:category_id=>nil)
      @hot_sub_positions = SubPosition.where('id in (222,139,31,19)')
    end
end
