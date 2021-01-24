class ArticlesController < ApplicationController
    #before_action kalder set_article på alle metoder dvs. @article = Article.find(params[:id])
    #Men kun de metoder som er skrevet i only:
    before_action :set_article, only: [:show, :edit, :update, :destroy]
  
    def show
      #finder id'et på den artikel du vil handle med
      set_article
    end
    
    def index
        @articles = Article.all
    end
    
    def new
      @article = Article.new
    end
    
    def edit
    end
    
    
    def create
      @article = Article.new(article_params)
      @article.user = User.first
      if @article.save
        flash[:notice] = "Article was created successfully!"
        redirect_to article_path(@article)
      #Kan forkortes:
      #redirect_to (@article)
      else
        render 'new'
      end
    end
    
    def update
      # => .update har samme effekt som .save. params.require, whitelister title og description så det kan bruges.
      if @article.update(article_params)
        #Giver besked efter man har trykket update
        flash[:notice] = "Article was updated successfully!"
        redirect_to article_path(@article)
      else
        render 'edit'
      end
    
    end
    
    def destroy
      @article.destroy
      redirect_to articles_path
    end
    
    #private means that any method I put below it, are available only to this controller
    private
    
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description) 
    end
    
end