class ArticlesController < ApplicationController
    # prevents update and destroy actions as this is a public API
    before_action :do_not_modify, only: [:update, :destroy]

    #creates a new article
    def create
        begin
            #fetching attributes from request parameters
            article_attributes = {title: params[:title], content: params[:content], author: params[:author], category: params[:category], published_at: params[:published_at]}

            #initializing a new article
            @article = Article.new(article_attributes)
        rescue
            #returns validation errors if any occurs
            render json: @article.errors, status: :unprocessable_entity
        else
            saves the article and returns appropriate response
            if @article.save
                render json: @article, status: :created
            else
                render json: @article.errors, status: :unprocessable_entity
            end
        end
    end

    #retrieves all articles, sorted by published date in descending order
    def index
        articles = Article.select(:id, :title, :content, :author, :category, :published_at).order(published_at: :desc)
        if articles.empty?
            # returns empty array if no articles exist
            render json: [], status: :ok
        else
            render json: articles, status: :ok
        end
    end

    #retrieves a specific article by ID
    def show
        begin
            @article = Article.find(params[:id])
        rescue
            #returns 404 status if artical record is not found
            render json: {"message": "Record not found"}, status: :not_found
        else
            render json: @article, status: :ok
        end
    end

    def update
        # The do_not_modify method runs before update operations, ensuring a JSON response with a 405 status, as modifications are not allowed in this public API.
    end

    def destroy
         # The do_not_modify method runs before delete operations, ensuring a JSON response with a 405 status, as modifications are not allowed in this public API.
    end

    private
    
    #strong parameters to permit only allowed fields
    def article_params
        params.require(:article).permit(:title, :content, :author, :category, :published_at)
    end

    restricts updating and deletion of articles
    def do_not_modify
        render json: {error: "Modifying or deleting articles is now alowed as it is public API"}, status: :method_not_allowed
    end
end
