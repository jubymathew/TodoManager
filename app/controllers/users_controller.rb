# users_controller.rb

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #render plain: User.all.to_a
    render plain: User.all.map{ |user| user.to_pleasent_string }.join("\n")
    #render plain:User.order(:due_date).map{ |user| user.to_pleasent_string }.join("\n")
  end

  def show
    id = params[:id]
    #render plain: "The id you wanted was #{id}"
    user = User.find(id)  # Returns None if not present.
    render plain: user.to_pleasent_string
  end

  def create
    #render plain: "Hey, this is create action!"
    #render plain: "Hey, Our Params are: #{params.to_s} "
    name = params[:name]
    email = params[:email]
    password = params[:password]

    new_user = User.create!(
      name: name,
      email: email,
      password: password
    )
    response_text = "Hey new user is created with id #{new_user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email, password: password)
    response_text = (user == nil) ? false : true
    render plain: response_text
  end

end
