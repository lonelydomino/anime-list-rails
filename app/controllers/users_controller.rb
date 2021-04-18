class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
    before_action :redirect_if_not_logged_in, only: [:show, :index]
    
  

    def index
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(signup_params)
        if @user.id
            session[:user_id] = @user.id
            redirect_to user_lists_path(@user), success: "Account created!"
        else
            flash.now[:error] = @user.errors.full_messages.to_sentence
            render action: :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if current_user.update(signup_params)
            redirect_to user_path, success: "Updated!"
        else
            redirect_to user_edit_path(current_user)
        end
    end

    private

    def signup_params
        params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :avatar)
    end
end