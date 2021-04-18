class ShowsController < ApplicationController
    def show
        @animeid = params["id"]
        @details = Api.new.get_anime_details(@animeid)   
    end

    def add
        @details = Api.new.get_anime_details(params["show_id"])
        @new_show = Show.new(name: @details["name"], desc: @details["desc"], api_id: @details["id"], image: @details["image"])
        @list = List.find(params["list_id"])
        @list.shows.each do |show|
            if show.name == @new_show.name
                # flash[:error] = "Anime already in list!"
                # byebug
                redirect_to show_path(id: params[:show_id])
                return false
            end
        end
        if @list.save
            # byebug
            @list.shows << @new_show
            redirect_to user_list_path(id: params["list_id"], user_id: current_user.id)
        else
            redirect_to show_path(id: params[:show_id])
         end
    end

    def destroy
        show = Show.find(params["show_id"])
        list = List.find(params["list_id"])

        if show.destroy
            redirect_to user_list_path(id: params["list_id"], user_id: current_user.id)
        else
            # flash[:error] = "Deletion error!"
            redirect_to user_list_path(id: params["list_id"], user_id: current_user.id)
        end
    end

end
