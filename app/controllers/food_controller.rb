require 'twilio-ruby'
class FoodController < ApplicationController
	skip_before_action :verify_authenticity_token
  def index
  end

  def login_action
  	response = {}
  	username = params[:user]
  	password = params[:password]
  	user = User.find_by_phone_number(username.to_i)
  	p user
  	if user.present? && user.password == password
       response[:status] = 200
       response[:message] = "success"
       session[:user_id]= user.id
       response[:details] = {"first_name" => user.first_name,"last_name" => user.last_name,"user_type" => user.user_type} 
  	else
      response[:status] = 500
  		response[:message] = "User does not exist, Please signup if you have not registered yet"
  	end
  	render :json => response.to_json 
  end

  def create_event
  	generate_event(params)
  	render :json => "success".to_json
  end

  def place_order
  	create_order(params)
  	render :json => "success".to_json
  end

  def get_order_details
  	result = []
  	orders = Event.find_by_id(params[:event_id]).orders
  	orders.each do |order|
      data = {}
      data["event_code"] = order.event.event_code
      data["no_of_meals"]  = order.no_of_meals
      result << data
  	end
    render :json => result.to_json
  end
 
	private
  	def generate_event_code
		charset = Array('A'..'Z') + Array('a'..'z')
		code = Array.new(6) { charset.sample }.join
		return code
	end

	def generate_event(params)
		location = params[:location]
		available_meals = params[:hosted]
		pno = params[:phone_number]
    email_id = params[:email]
    event_code = generate_event_code
    event_status = "Active"
    Event.create(:location => location,:available_meals => available_meals,:phone_number => pno,:email_id => email_id,:donor_user_id => session[:user_id],:event_code => event_code,:status => event_status)
    User.where("user_type = 'Receiver'").each do |user|
			UserMailer.send_email(user.email_id,event_code).deliver!
	    send_message(user.phone_number,event_code)
    end
	end

	def send_message(to,token)
		account_sid = 'AC94a35860e3eff571097ba9b0b8723bd0'
		auth_token = '8200d6c7147f78dd987e35d4accf20ff'
		client = Twilio::REST::Client.new(account_sid, auth_token)
		from = '+12018796930' # Your Twilio number
		# to = '+917204225176' # Your mobile phone number
		client.messages.create(
			from: from,
			to: "+91"+to,
			body: "Hey! donor is waiting.Please use #{token} to order food"
		)
	end
	
	def create_order(params)
		code = params[:event_code]
		event = Event.find_by_event_code(code)
		p "============create_order=========="
		p code
		p event
		order = Order.create(:receiver_user_id => params[:receiver_user_id],:donor_user_id => event.donor_user_id,:no_of_meals => params[:no_of_meals],:event_id => event.id)
	end
end
