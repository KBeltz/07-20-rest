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

post "/users/delete_form" do # Delete a specific User
  user = User.find(params[:id])
  @user_email = @user.email
  user.destroy
  erb :"users/deleted"
end

get "/users/:id" do # Find a specific User
  @user = User.find(params[:id])
  erb :"users/show_user"
end
