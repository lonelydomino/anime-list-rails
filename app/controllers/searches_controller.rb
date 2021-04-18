class SearchesController < ApplicationController

    def index
        
    end

    def results
        api_obj = Api.new
        @data = api_obj.search(params["search"])
    end
end
