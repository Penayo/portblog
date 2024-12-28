class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]
  before_action :redirect_if_authenticated, only: [ :new, :create ]

  def new
    @user = Account.new
  end

  def create
    puts "Creating a session"
    puts params.inspect

    @account = Account.find_by(email: params[:account][:email])

    if @account.present? && @account.authenticate(params[:account][:password])
      session[:user_id] = @account.id
      redirect_to root_path, flash: { success: "Logged in successfully" }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nill
    redirect_to root_path, flash: { success: "Logged Out" }
  end
end
