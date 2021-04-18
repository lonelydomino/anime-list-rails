class ListsController < ApplicationController
    def index
        @lists = current_user.lists
    end
    def show
        @list = List.find_by_id(params[:id])
    end

    def new
        @list = List.new(user_id: params[:user_id])
    end

    def create
        new_list = List.new(list_params)
        if new_list.save
            redirect_to user_lists_path, success: "List created!"
            return false
        else
            redirect_to new_user_list_path, error: new_list.errors.full_messages.to_sentence
        end
    end

    def edit
        @list = List.find_by_id(params[:id])
    end

    def update
        list = List.find_by_id(params[:id])
        list.update(list_params)
        redirect_to user_lists_path
    end

    def destroy
        List.find(params[:id]).destroy
        redirect_to user_lists_path
    end

    private
    
    def list_params
        params.require(:list).permit(:name, :desc, :user_id)
    end
end
