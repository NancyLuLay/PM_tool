class UsersController < ApplicationController
    def new
    @user = User.new
    end

    def create
      @user = User.new user_params
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Thanks for signing up"
      else
        flash[:alert] = "Fix errors below"
        render :new
      end
    end

    private
    def user_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end

    def edit_password

    end

    def update_password
      if @user.authenticate(params[:user][:old_password]) && (@user.update user_params)
        redirect_to @user, notice: "Password updated successfully"
      else
        flash[:alert]="Invalid. Please try again."
        render :edit_password
      end
    end
    
end
