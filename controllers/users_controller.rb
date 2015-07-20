get "/users/new" do # Bring up form to create User
  erb :"users/new"
end

post "/users/create" do # Create a User
  email = params["email"]
  password = BCrypt::Password.create(params["password"])
  user = User.create({email: email, password: password})
  redirect "/users/#{user.id}"
end

get "/users" do # Show all Users
  @array_of_users = User.all
  erb :"/users/all_users"
end

get "/users/delete_form" do
  @array_of_users = User.all
  erb :"/users/delete_form"
end

post "/users/:id" do # Delete a specific User
  user = User.find(params["user_id"])
  binding.pry
  user.destroy
  erb :"users/deleted"
end

get "/users/:id" do # Find a specific User
  @user = User.find(params[:id])
  erb :"users/show_user"
end
