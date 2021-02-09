class ArticlesController < ApplicationController
    #before_action kalder set_article på alle metoder dvs. @article = Article.find(params[:id])
    #Men kun de metoder som er skrevet i only:
    before_action :set_article, only: [:show, :edit, :update, :destroy] #finder id'et på den artikel du vil handle med
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def show
      @user = User.first
    end
    
    def index
        @articles = Article.all
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end
    
    def new
      @article = Article.new
    end
    
    def edit
      
    end
    
    
    def create
      @article = Article.new(article_params)
      @article.user = current_user
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
      flash[:danger] = "Article was deleted"
      redirect_to articles_path
    end
    
    #private means that any method I put below it, are available only to this controller
    private
    
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description, category_ids: []) 
    end
    
    def require_same_user
      if current_user != @article.user && !current_user.admin? #if current user is admin. Don't redirect
      flash[:alert] = "You cannot edit others articles"
        redirect_to @article
      end
    end
    
    
end