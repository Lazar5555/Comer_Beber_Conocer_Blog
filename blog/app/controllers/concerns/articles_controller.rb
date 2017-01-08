class ArticlesController < ApplicationController
    #Un callback creado por nosostros
    #before_action :validate_user, except: [:show, :index]

    #callback de devise
    before_action :authenticate_user!, except: [:show, :index]
    before_action :set_article, except: [:index, :new, :create]
    before_action :authenticate_editor!, only: [:new, :create, :update]
    before_action :authenticate_admin!, only: [:destroy]

    #GET /articles
    def index
        @articles = Article.all
    end

    #GET articles/:id
    def show
        @article.update_visits_count
        @comment = Comment.new
    end

    #GET articles/new
    def new
        @article = Article.new
        @categories = Category.all
    end

    def edit

    end

    #POST /articles
    def create

        @article = current_user.articles.new(article_params)
        @article.categories = params[:categories]
        if @article.save
              redirect_to @article
        else
            render :new
        end
    end

    #
    def destroy
        @article.destroy
        redirect_to articles_path
    end

    #PUT articles/:id
    def update
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    private
    def article_params
        params.require(:article).permit(:title, :body, :cover, :categories)
    end

    def set_article
        @article = Article.find(params[:id])
    end

    #Función para nuestro callback
    #def validate_user
    #    redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
    #end
end
