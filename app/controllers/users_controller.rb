class UsersController < ApplicationController
  
  def new
    @user = User.find_by({ "id" => params["id"] })
  end

  def create
    if User.find_by({ "email" => params["email"] }) == nil
      @user = User.new
      #@user["first_name"] = params["first_name"]
      #@user["last_name"] = params["last_name"]
      @user["username"] = params["username"]
      @user["email"] = params["email"]
      @user["password"] = BCrypt::Password.create(params["password"])
      @user.save
      redirect_to "/login"
    else
      flash["notice"] = "Email taken."
      redirect_to "/users/new"
    end
  end
end
