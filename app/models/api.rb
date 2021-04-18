class Api < ApplicationRecord
    def get_anime_details(idnum)
        response = RestClient.get "https://kitsu.io/api/edge/anime/#{idnum}"
       
        json = JSON.parse(response)
        data = json["data"]
        hash = {}
        
        # byebug
        hash["id"] = data["id"]
        hash["name"] = data["attributes"]["titles"].first[1]
        hash["desc"] = data["attributes"]["description"]
        hash["title"] = data["attributes"]["titles"].first[1]
        hash["image"] = data["attributes"]["posterImage"]["large"]
        hash
     end

   #   def get_anime_collection
   #      response = RestClient.get "https://kitsu.io/api/edge/anime/"
   #      json = JSON.parse(response)
   #      @anime_collection = json["data"]
   #      @anime_collection
   #   end

     def search(string)
        string.gsub!(/\s/,'%20')
        response = RestClient.get "https://kitsu.io/api/edge/anime?filter[text]=#{string}&page[limit]=20"
        json = JSON.parse(response)
        json_data = json["data"]
        json_data
     end
end
