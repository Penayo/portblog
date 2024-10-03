class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    puts params[:author]

    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path
    else
      render :new, status: :unprocessable_status
    end
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name, :email, :status, :profile_img)
    end
end
