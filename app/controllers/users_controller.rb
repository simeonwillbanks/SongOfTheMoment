class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Join"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      flash[:success] = "Welcome to Song of the Moment!"
      redirect_to @user
    else
      @title = "Join"
      render 'new'
    end
  end

end
