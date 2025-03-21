class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "username" => params["username"] })
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        redirect_to "/places"
      else
        flash["notice"] = "Incorrect login credentials."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Incorrect login credentials."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Thanks for stopping by!"
    redirect_to "/login"
  end
end
  