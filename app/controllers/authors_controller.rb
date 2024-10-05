class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path
    else
      render :new, status: :unprocessable_status
    end
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to authors_path
    else
      render :edit, status: :unprocessable_status
    end
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name, :email, :status, :profile_image)
    end
end
