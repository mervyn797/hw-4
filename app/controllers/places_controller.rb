class PlacesController < ApplicationController

  def index
    if @current_user
      @places = Place.all
    end
    
  end

  def show
    if @current_user
      @place = Place.find_by({ "id" => params["id"] })
      @posts = Post.where({ "place_id" => @place["id"] })
      @posts_currentuser = @posts.where({"user_id"=> @current_user["id"]})
    else
      flash["notice"] = "Login first."
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place.save
    redirect_to "/places"
  end

end
