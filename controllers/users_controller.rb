get "/users/new" do
  erb :"users/new"
end

post "/users/create" do
  email = params["email"]
  password = BCrypt::Password.create(params["password"])
  user = User.create({email: email, password: password})
  redirect "/users/#{user.id}"
end

get "/users/:id" do
  @user = User.find(params[:id])
  erb :"users/show_user"
end



get "/users" do # Show all users
  @array_of_users = User.all
end
