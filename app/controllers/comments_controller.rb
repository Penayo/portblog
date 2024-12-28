class CommentsController < ApplicationController
  def index
    @comments = Comments.find(params[:article_id])
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      respond_to do |f|
        f.turbo_stream
      end
    end
    # redirect_to article_path(@article)
  end

  def reply
    @article = Article.find(params[:article_id])
    @reply = Comment.new(article_id: @article.id, response_id: params[:comment_id])
    puts @reply.inspect

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:comment_id])

    @comment.destroy
    redirect_to article_path(@article), status: :see_others
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status, :article_id, :response_id)
    end
end
