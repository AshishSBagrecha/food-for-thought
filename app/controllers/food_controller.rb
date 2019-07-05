class FoodController < ApplicationController
	skip_before_action :verify_authenticity_token
  def index
  end

  def login_action
  	p "===================================="
  	p "login_action"
  	response = {}
  	username = params[:user]
  	password = params[:password]
  	user = User.find_by_phone_number(username)
  	if user.present? && user.password == password
       response[:status] = 200
       response[:message] = "success"
       response[:details] = {"first_name" => user.first_name,"last_name" => user.last_name,"user_type" => user_type} 
  	else
      response[:status] = 500
  		response[:message] = "User does not exist, Please signup if you have not registered yet"
  	end
  	render :json => response.to_json 
  end
end
