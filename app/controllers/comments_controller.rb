class CommentsController < ApplicationController
  def index
    @comments = Comments.find(params[:article_id])
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:comment_id])

    @comment.destroy
    redirect_to article_path(@article), status: :see_others
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
