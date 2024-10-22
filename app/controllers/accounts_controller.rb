class AccountsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
    render layout: "sessions"
  end

  def show
    @account = Account.find(params[:id])
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(create_account_params)

    if @account.save
      session[:user_id] = @account.id
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @account = Account.find(params[:id])

    if @account.update(update_account_params)
      redirect_to account_path @account
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def update_account_params
      params.require(:account).permit([:first_name, :last_name, :headline, :status, :profile_img])
    end

    def create_account_params
      params.require(:account).permit([:email, :password, :password_confirmation])
    end
end
