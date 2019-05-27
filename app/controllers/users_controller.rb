class UsersController < ApplicationController
  def new
    @user = User.new #the User object required as an argument to form_for
  end

  def show
    @user = User.find(params[:id])
    #debugger
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # = redirect_to user_url(@user)
        #redirect to the different URL without a new request
    else
      render 'new'
        #With the same URL, render the different template without a new request
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end